import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String _categoryTitle = '';
  List<Meal> _displayedMeals = [];
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      final category = routeArgs[CategoryItem.categoryArgument] as Category;
      _categoryTitle = category.title;
      _displayedMeals = dummyMeals.where((element) => element.categoryIds.contains(category.id)).toList();
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemCount: _displayedMeals.length,
        itemBuilder: (ctx, index) => MealItem(_displayedMeals[index], (id) => setState(() => _displayedMeals.removeWhere((element) => id == element.id))),
      ),
    );
  }
}
