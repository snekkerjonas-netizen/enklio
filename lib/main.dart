import 'package:flutter/material.dart';
import 'src/app/app_root.dart';
import 'src/app/flow_coordinator.dart';
import 'src/features/task.dart';

void main() {
  // Demo tasks for testing the flow
  final demoTasks = [
    Task(
      id: '1',
      title: 'Oppvarming',
      duration: const Duration(minutes: 5),
      bufferDuration: const Duration(seconds: 30),
    ),
    Task(
      id: '2',
      title: 'Hovedøvelse',
      duration: const Duration(minutes: 20),
      bufferDuration: const Duration(minutes: 1),
    ),
    Task(
      id: '3',
      title: 'Nedkjøling',
      duration: const Duration(minutes: 5),
    ),
  ];

  final flow = FlowCoordinator(tasks: demoTasks);

  runApp(AppRoot(flow: flow));
}
