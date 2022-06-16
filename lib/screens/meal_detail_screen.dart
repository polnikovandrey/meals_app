import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/detail-meal';

  final bool Function(Meal meal) _isMealFavorite;
  final void Function(Meal meal) _toggleFavorite;

  const MealDetailScreen(this._isMealFavorite, this._toggleFavorite, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final Meal meal = routeArgs[MealItem.mealArgument] as Meal;
    var themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(meal.id),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(themeData, 'Ingredients'),
            _buildSectionListContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: themeData.colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            _buildSectionTitle(themeData, 'Steps'),
            _buildSectionListContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider(),
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => _toggleFavorite(meal),
        child: Icon(_isMealFavorite(meal) ? Icons.star_border : Icons.star),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData themeData, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: themeData.textTheme.headline6,
      ),
    );
  }

  Widget _buildSectionListContainer(Widget sectionContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: sectionContent,
    );
  }
}
