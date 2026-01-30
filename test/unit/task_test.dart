import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/features/task.dart';

void main() {
  test('Task can be created with duration and default bufferDuration', () {
    final task = Task(
      title: 'Test Task',
      duration: const Duration(minutes: 30),
    );
    
    expect(task.title, 'Test Task');
    expect(task.duration, const Duration(minutes: 30));
    expect(task.bufferDuration, const Duration(seconds: 0));
  });

  test('Task can be created with custom bufferDuration', () {
    final task = Task(
      title: 'Task with buffer',
      duration: const Duration(minutes: 45),
      bufferDuration: const Duration(minutes: 5),
    );
    
    expect(task.title, 'Task with buffer');
    expect(task.duration, const Duration(minutes: 45));
    expect(task.bufferDuration, const Duration(minutes: 5));
  });
}
