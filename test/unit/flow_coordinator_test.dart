import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/app/flow_coordinator.dart';
import 'package:enklio/src/features/task.dart';

void main() {
  group('FlowCoordinator Flow Test', () {
    late FlowCoordinator coordinator;
    late List<Task> mockTasks;

    setUp(() {
      // Definer en enkel test-rekkefølge med to oppgaver
      mockTasks = [
        Task(title: 'Test Oppgave 1', duration: const Duration(seconds: 1)),
        Task(title: 'Test Oppgave 2', duration: const Duration(seconds: 1)),
      ];
      coordinator = FlowCoordinator(tasks: mockTasks);
    });

    test('Starter på StartScreen (indeks -1)', () {
      expect(coordinator.currentIndex, -1);
      expect(coordinator.currentTask, isNull);
      expect(coordinator.isFinished, isFalse);
    });

    test('Start-metoden flytter oss til første oppgave', () {
      coordinator.start();
      expect(coordinator.currentIndex, 0);
      expect(coordinator.currentTask, equals(mockTasks[0]));
      expect(coordinator.currentTask?.title, 'Test Oppgave 1');
    });

    test('Next-metoden går videre til andre oppgave', () {
      coordinator.start(); // Er på 0
      coordinator.next();  // Går til 1
      expect(coordinator.currentIndex, 1);
      expect(coordinator.currentTask, equals(mockTasks[1]));
    });

    test('Fullfører flyten når alle oppgaver er gjort', () {
      coordinator.start(); // 0
      coordinator.next();  // 1
      coordinator.next();  // 2 (Ferdig)
      
      expect(coordinator.currentIndex, 2);
      expect(coordinator.isFinished, isTrue);
      expect(coordinator.currentTask, isNull);
    });
  });
}