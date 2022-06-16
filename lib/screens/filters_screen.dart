import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
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
}
