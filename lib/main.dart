import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const routeName = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline5: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
          headline6: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        routeName: (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
