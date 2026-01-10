import 'package:flutter/material.dart';
import '../ui/start_screen.dart';
import '../ui/step_screen.dart';
import '../ui/completion_screen.dart';
import 'flow_coordinator.dart';

class AppRoot extends StatefulWidget {
  final FlowCoordinator flow;
  const AppRoot({super.key, required this.flow});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int screen = 0;

  @override
  Widget build(BuildContext context) {
    if (screen == 0) {
      return MaterialApp(
        home: StartScreen(
          flow: widget.flow,
        ),
      );
    }

    if (screen == 1) {
      return const MaterialApp(
        home: StepScreen(
          stepText: 'Steg 1',
          onNext: _noop,
        ),
      );
    }

    return const MaterialApp(
      home: CompletionScreen(
        onDone: _noop,
      ),
    );
  }

  static void _noop() {}
}
