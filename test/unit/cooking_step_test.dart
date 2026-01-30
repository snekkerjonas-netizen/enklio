import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/models/cooking_step.dart';

void main() {
  group('CookingStep', () {
    test('duration getter converts minutes correctly', () {
      const step = CookingStep(
        id: 'step-1',
        instruction: 'Kok pastaen',
        durationMinutes: 10,
      );

      expect(step.duration, const Duration(minutes: 10));
      expect(step.duration.inMinutes, 10);
      expect(step.duration.inSeconds, 600);
    });

    test('isWaitStep defaults to false', () {
      const step = CookingStep(
        id: 'step-1',
        instruction: 'Bland ingrediensene',
        durationMinutes: 5,
      );

      expect(step.isWaitStep, isFalse);
    });

    test('isWaitStep can be set to true', () {
      const step = CookingStep(
        id: 'step-1',
        instruction: 'La deigen heve',
        durationMinutes: 60,
        isWaitStep: true,
      );

      expect(step.isWaitStep, isTrue);
    });

    test('tip is optional', () {
      const stepWithoutTip = CookingStep(
        id: 'step-1',
        instruction: 'Stek kjøttet',
        durationMinutes: 10,
      );

      const stepWithTip = CookingStep(
        id: 'step-2',
        instruction: 'Rør i sausen',
        durationMinutes: 5,
        tip: 'Bruk lav varme',
      );

      expect(stepWithoutTip.tip, isNull);
      expect(stepWithTip.tip, 'Bruk lav varme');
    });
  });
}
