enum MealComplexity { simple, challenging, hard }

enum MealAffordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categoryIds;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final MealComplexity complexity;
  final MealAffordability affordability;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;

  const Meal({
    required this.id,
    required this.categoryIds,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.glutenFree,
    required this.lactoseFree,
    required this.vegan,
    required this.vegetarian,
  });
}
