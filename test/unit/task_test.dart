import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/features/task.dart';

void main() {
  group('Task', () {
    test('can create task with all fields', () {
      final task = Task(
        id: 'task-1',
        title: 'Test Task',
        duration: const Duration(minutes: 10),
        bufferDuration: const Duration(seconds: 30),
      );

      expect(task.id, 'task-1');
      expect(task.title, 'Test Task');
      expect(task.duration, const Duration(minutes: 10));
      expect(task.bufferDuration, const Duration(seconds: 30));
    });

    test('id is optional', () {
      final task = Task(
        title: 'Task without ID',
        duration: const Duration(minutes: 5),
      );

      expect(task.id, isNull);
      expect(task.title, 'Task without ID');
    });

    test('bufferDuration defaults to zero', () {
      final task = Task(
        title: 'Task with default buffer',
        duration: const Duration(minutes: 15),
      );

      expect(task.bufferDuration, const Duration.zero);
    });

    test('duration is stored as Duration', () {
      final task = Task(
        title: 'Duration Test',
        duration: const Duration(minutes: 20),
      );

      expect(task.duration.inMinutes, 20);
      expect(task.duration.inSeconds, 1200);
    });

    test('bufferDuration can be set to custom value', () {
      final task = Task(
        title: 'Task with custom buffer',
        duration: const Duration(minutes: 10),
        bufferDuration: const Duration(minutes: 2),
      );

      expect(task.bufferDuration.inMinutes, 2);
      expect(task.bufferDuration.inSeconds, 120);
    });

    test('multiple tasks can have same properties', () {
      final task1 = Task(
        id: '1',
        title: 'Identical Task',
        duration: const Duration(minutes: 5),
      );

      final task2 = Task(
        id: '2',
        title: 'Identical Task',
        duration: const Duration(minutes: 5),
      );

      expect(task1.title, task2.title);
      expect(task1.duration, task2.duration);
      expect(task1.id, isNot(task2.id));
    });
  });
}
