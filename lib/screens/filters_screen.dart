import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> _filters;
  final void Function(Map<String, bool> filterData) _setFilters;

  const FiltersScreen(this._filters, this._setFilters, {Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;


  @override
  void initState() {
    super.initState();
    _glutenFree = widget._filters['gluten']!;
    _vegetarian = widget._filters['vegetarian']!;
    _vegan = widget._filters['vegan']!;
    _lactoseFree = widget._filters['lactose']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: _saveFilters,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection!',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitchListTile('Gluten-free', 'Only include gluten-free meals.', _glutenFree, (value) => _glutenFree = value),
                _createSwitchListTile('Vegetarian', 'Only include vegetarian meals.', _vegetarian, (value) => _vegetarian = value),
                _createSwitchListTile('Vegan', 'Only include vegan meals.', _vegan, (value) => _vegan = value),
                _createSwitchListTile('Lactose-free', 'Only include lactose-free meals.', _lactoseFree, (value) => _lactoseFree = value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createSwitchListTile(String title, String subtitle, bool value, void Function(bool value) updateStateFunction) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) => setState(() => updateStateFunction(value)),
    );
  }

  void _saveFilters() {
    final Map<String, bool> filters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    widget._setFilters(filters);
  }
}
