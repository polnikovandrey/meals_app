import 'package:flutter/material.dart';

class Category {
  final String _id;
  final String _title;
  final Color _color;

  const Category({required String id, required String title, Color color = Colors.orange})
      : _id = id,
        _title = title,
        _color = color;
}
