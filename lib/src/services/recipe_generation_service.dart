import '../models/recipe.dart';
import '../models/ingredient.dart';
import '../models/cooking_step.dart';

/// Service for generating recipes
/// Mock implementation inspired by TS geminiService.ts
/// In production, this would call an AI service like Gemini
abstract class RecipeGenerationService {
  Future<Recipe> generateRecipe(String query);
}

/// Mock implementation of RecipeGenerationService for development
class MockRecipeGenerationService implements RecipeGenerationService {
  @override
  Future<Recipe> generateRecipe(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return a mock recipe
    return Recipe(
      id: 'mock-recipe-${DateTime.now().millisecondsSinceEpoch}',
      title: 'Enkel Pasta Carbonara',
      description: 'En klassisk italiensk pastarett med egg, bacon og parmesan.',
      servings: 4,
      totalTimeMinutes: 25,
      cuisine: 'Italiensk',
      difficulty: 'Lett',
      ingredients: const [
        Ingredient(
          name: 'spaghetti',
          amount: '400',
          unit: 'g',
        ),
        Ingredient(
          name: 'bacon',
          amount: '200',
          unit: 'g',
          preparation: 'skåret i terninger',
        ),
        Ingredient(
          name: 'egg',
          amount: '4',
          unit: 'stk',
        ),
        Ingredient(
          name: 'parmesan',
          amount: '100',
          unit: 'g',
          preparation: 'revet',
        ),
        Ingredient(
          name: 'salt og pepper',
          amount: 'etter smak',
        ),
      ],
      steps: const [
        CookingStep(
          id: 'step-1',
          instruction: 'Kok pastaen i saltet vann ifølge pakken.',
          durationMinutes: 10,
          tip: 'Spar litt pastavann til sausen.',
        ),
        CookingStep(
          id: 'step-2',
          instruction: 'Stek baconen på middels varme til den er sprø.',
          durationMinutes: 5,
        ),
        CookingStep(
          id: 'step-3',
          instruction: 'Visp sammen egg og parmesan i en bolle.',
          durationMinutes: 2,
          tip: 'Romtempererte egg gir best resultat.',
        ),
        CookingStep(
          id: 'step-4',
          instruction: 'Hell den varme pastaen over eggblandingen og rør godt. Tilsett bacon.',
          durationMinutes: 3,
          tip: 'Pastaens varme vil koke egget nok til å lage en kremet saus.',
        ),
        CookingStep(
          id: 'step-5',
          instruction: 'Server med ekstra parmesan og sort pepper.',
          durationMinutes: 1,
        ),
      ],
    );
  }
}
