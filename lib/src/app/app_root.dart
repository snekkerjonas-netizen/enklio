import 'package:flutter/material.dart';
import 'flow_coordinator.dart';
import '../ui/start_screen.dart';
import '../ui/step_screen.dart';
import '../ui/completion_screen.dart';

class AppRoot extends StatefulWidget {
  final FlowCoordinator flow;

  const AppRoot({super.key, required this.flow});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int step = 0;

  @override
  void initState() {
    super.initState();

    widget.flow.onStart = () {
      setState(() => step = 1);
    };

    widget.flow.onNext = () {
      setState(() => step = 2);
    };

    widget.flow.onComplete = () {
      setState(() => step = 0);
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: switch (step) {
        0 => StartScreen(onStart: widget.flow.start),
        1 => StepScreen(flow: widget.flow),
        2 => CompletionScreen(flow: widget.flow),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
