import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';
import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final String _title;
  final Color _color;

  CategoryItem(Category category, {Key? key})
      : _title = category.title,
        _color = category.color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _color.withOpacity(0.7),
              _color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const CategoryMealsScreen(),
    ));
  }
}
