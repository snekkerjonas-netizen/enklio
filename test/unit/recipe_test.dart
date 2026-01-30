import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/models/recipe.dart';
import 'package:enklio/src/models/ingredient.dart';
import 'package:enklio/src/models/cooking_step.dart';

void main() {
  group('Recipe', () {
    test('totalTime getter converts minutes correctly', () {
      const recipe = Recipe(
        id: 'recipe-1',
        title: 'Test Oppskrift',
        ingredients: [],
        steps: [],
        totalTimeMinutes: 45,
      );

      expect(recipe.totalTime, const Duration(minutes: 45));
      expect(recipe.totalTime.inMinutes, 45);
    });

    test('can create recipe with all fields', () {
      const recipe = Recipe(
        id: 'recipe-1',
        title: 'Pasta Carbonara',
        description: 'En klassisk italiensk rett',
        ingredients: [
          Ingredient(name: 'pasta', amount: '400', unit: 'g'),
        ],
        steps: [
          CookingStep(
            id: 'step-1',
            instruction: 'Kok pastaen',
            durationMinutes: 10,
          ),
        ],
        servings: 4,
        totalTimeMinutes: 25,
        cuisine: 'Italiensk',
        difficulty: 'Lett',
      );

      expect(recipe.id, 'recipe-1');
      expect(recipe.title, 'Pasta Carbonara');
      expect(recipe.description, 'En klassisk italiensk rett');
      expect(recipe.ingredients.length, 1);
      expect(recipe.steps.length, 1);
      expect(recipe.servings, 4);
      expect(recipe.totalTimeMinutes, 25);
      expect(recipe.cuisine, 'Italiensk');
      expect(recipe.difficulty, 'Lett');
    });

    test('servings defaults to 4', () {
      const recipe = Recipe(
        id: 'recipe-1',
        title: 'Test',
        ingredients: [],
        steps: [],
        totalTimeMinutes: 30,
      );

      expect(recipe.servings, 4);
    });

    test('optional fields can be null', () {
      const recipe = Recipe(
        id: 'recipe-1',
        title: 'Enkel Oppskrift',
        ingredients: [],
        steps: [],
        totalTimeMinutes: 15,
      );

      expect(recipe.description, isNull);
      expect(recipe.cuisine, isNull);
      expect(recipe.difficulty, isNull);
    });
  });
}
