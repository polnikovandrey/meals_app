import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/detail-meal';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final Meal meal = routeArgs[MealItem.mealArgument] as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.id),
      ),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
