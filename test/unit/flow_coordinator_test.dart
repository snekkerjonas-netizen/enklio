import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/app/flow_coordinator.dart';
import 'package:enklio/src/features/task.dart';
import 'package:enklio/src/models/app_view.dart';

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
      expect(coordinator.isOnStartScreen, isTrue);
    });

    test('Start-metoden flytter oss til første oppgave', () {
      coordinator.start();
      expect(coordinator.currentIndex, 0);
      expect(coordinator.currentTask, equals(mockTasks[0]));
      expect(coordinator.currentTask?.title, 'Test Oppgave 1');
      expect(coordinator.currentView, AppView.steps);
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
      expect(coordinator.currentView, AppView.completion);
    });

    test('Complete-metoden resetter flyten', () {
      coordinator.start();
      coordinator.next();
      coordinator.complete();
      
      expect(coordinator.currentIndex, -1);
      expect(coordinator.isOnStartScreen, isTrue);
      expect(coordinator.currentView, AppView.steps);
    });

    test('SetView endrer currentView', () {
      expect(coordinator.currentView, AppView.steps);
      coordinator.setView(AppView.search);
      expect(coordinator.currentView, AppView.search);
      coordinator.setView(AppView.detail);
      expect(coordinator.currentView, AppView.detail);
    });
  });
}