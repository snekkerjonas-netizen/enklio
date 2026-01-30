import 'ingredient.dart';
import 'cooking_step.dart';

/// Represents a recipe with ingredients and cooking steps
class Recipe {
  final String id;
  final String title;
  final String? description;
  final List<Ingredient> ingredients;
  final List<CookingStep> steps;
  final int servings;
  final int totalTimeMinutes;
  final String? cuisine;
  final String? difficulty;

  const Recipe({
    required this.id,
    required this.title,
    this.description,
    required this.ingredients,
    required this.steps,
    this.servings = 4,
    required this.totalTimeMinutes,
    this.cuisine,
    this.difficulty,
  });

  Duration get totalTime => Duration(minutes: totalTimeMinutes);
}
