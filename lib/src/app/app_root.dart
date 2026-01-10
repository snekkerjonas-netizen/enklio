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
    Widget body;

    if (screen == 0) {
      body = StartScreen(flow: widget.flow);
    } else if (screen == 1) {
      body = StepScreen(
        stepText: 'Steg 1',
        onNext: () => setState(() => screen = 2),
      );
    } else {
      body = CompletionScreen(
        onDone: () => setState(() => screen = 0),
      );
    }

    return MaterialApp(home: body);
  }
}
