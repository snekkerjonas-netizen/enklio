import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/models/ingredient.dart';

void main() {
  group('Ingredient', () {
    test('toString with all fields', () {
      const ingredient = Ingredient(
        name: 'tomat',
        amount: '2',
        unit: 'stk',
        preparation: 'hakket',
      );

      expect(ingredient.toString(), '2 stk tomat (hakket)');
    });

    test('toString without unit', () {
      const ingredient = Ingredient(
        name: 'salt',
        amount: 'etter smak',
      );

      expect(ingredient.toString(), 'etter smak salt');
    });

    test('toString without preparation', () {
      const ingredient = Ingredient(
        name: 'mel',
        amount: '500',
        unit: 'g',
      );

      expect(ingredient.toString(), '500 g mel');
    });

    test('toString with empty unit', () {
      const ingredient = Ingredient(
        name: 'vann',
        amount: '1',
        unit: '',
      );

      expect(ingredient.toString(), '1 vann');
    });

    test('toString with empty preparation', () {
      const ingredient = Ingredient(
        name: 'løk',
        amount: '1',
        unit: 'stk',
        preparation: '',
      );

      expect(ingredient.toString(), '1 stk løk');
    });
  });
}
