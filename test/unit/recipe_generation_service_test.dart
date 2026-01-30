import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/services/recipe_generation_service.dart';

void main() {
  group('MockRecipeGenerationService', () {
    late MockRecipeGenerationService service;

    setUp(() {
      service = MockRecipeGenerationService();
    });

    test('generateRecipe returns a valid Recipe', () async {
      final recipe = await service.generateRecipe('pasta carbonara');

      expect(recipe.id, isNotEmpty);
      expect(recipe.title, isNotEmpty);
      expect(recipe.ingredients, isNotEmpty);
      expect(recipe.steps, isNotEmpty);
      expect(recipe.totalTimeMinutes, greaterThan(0));
    });

    test('generateRecipe has a delay', () async {
      final stopwatch = Stopwatch()..start();
      await service.generateRecipe('test');
      stopwatch.stop();

      // Should take at least 1 second (allowing for some margin)
      expect(stopwatch.elapsedMilliseconds, greaterThan(900));
    });

    test('generateRecipe creates unique IDs', () async {
      final recipe1 = await service.generateRecipe('test1');
      final recipe2 = await service.generateRecipe('test2');

      expect(recipe1.id, isNot(equals(recipe2.id)));
    });

    test('mock recipe has all expected fields', () async {
      final recipe = await service.generateRecipe('test');

      expect(recipe.title, 'Enkel Pasta Carbonara');
      expect(recipe.description, isNotNull);
      expect(recipe.servings, 4);
      expect(recipe.totalTimeMinutes, 25);
      expect(recipe.cuisine, 'Italiensk');
      expect(recipe.difficulty, 'Lett');
      expect(recipe.ingredients.length, 5);
      expect(recipe.steps.length, 5);
    });

    test('mock recipe steps have valid durations', () async {
      final recipe = await service.generateRecipe('test');

      for (final step in recipe.steps) {
        expect(step.durationMinutes, greaterThan(0));
        expect(step.duration.inMinutes, step.durationMinutes);
      }
    });

    test('mock recipe ingredients are properly formatted', () async {
      final recipe = await service.generateRecipe('test');

      for (final ingredient in recipe.ingredients) {
        expect(ingredient.name, isNotEmpty);
        expect(ingredient.amount, isNotEmpty);
      }
    });
  });
}
