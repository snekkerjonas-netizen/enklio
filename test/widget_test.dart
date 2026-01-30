// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:enklio/src/app/app_root.dart';
import 'package:enklio/src/app/flow_coordinator.dart';
import 'package:enklio/src/features/task.dart';

void main() {
  testWidgets('App root renders smoke test', (WidgetTester tester) async {
    // Build our app root and trigger a frame.
    final coordinator = FlowCoordinator(
      tasks: [
        Task(title: 'Test Task', duration: const Duration(minutes: 1)),
      ],
    );
    
    await tester.pumpWidget(AppRoot(flow: coordinator));

    // Verify that app renders
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
