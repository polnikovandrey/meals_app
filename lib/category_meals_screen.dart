import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final Category category = routeArgs[CategoryItem.categoryArgument] as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: const Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
