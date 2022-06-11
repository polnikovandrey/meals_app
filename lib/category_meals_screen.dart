import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category _category;

  const CategoryMealsScreen(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: const Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
