import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoritesScreen(this._favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, index) => MealItem(_favoriteMeals[index], (id) {}),
      );
    }
  }
}
