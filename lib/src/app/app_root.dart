import 'package:flutter/material.dart';
import 'flow_coordinator.dart';
import '../ui/start_screen.dart';
import '../ui/step_screen.dart';
import '../ui/completion_screen.dart';

class AppRoot extends StatelessWidget {
  final FlowCoordinator flow;

  const AppRoot({super.key, required this.flow});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBuilder(
        animation: flow,
        builder: (context, child) {
          if (flow.isOnStartScreen) {
            return StartScreen(coordinator: flow);
          } else if (flow.isFinished) {
            return CompletionScreen(flow: flow);
          } else if (flow.currentTask != null) {
            return StepScreen(
              task: flow.currentTask!,
              onCompleted: flow.next,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
