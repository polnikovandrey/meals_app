import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final Category category = routeArgs[CategoryItem.categoryArgument] as Category;
    final categoryMeals = dummyMeals.where((element) => element.categoryIds.contains(category.id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) => MealItem(categoryMeals[index]),
      ),
    );
  }
}
