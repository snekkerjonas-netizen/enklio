import 'package:flutter/material.dart';
import '../ui/start_screen.dart';
import '../ui/step_screen.dart';
import '../ui/completion_screen.dart';
import 'flow_coordinator.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final FlowCoordinator flow;
  int step = 0;

  @override
  void initState() {
    super.initState();

    flow = FlowCoordinator(
      onStart: () => setState(() => step = 1),
      onStepDone: () => setState(() => step = 2),
      onComplete: () => setState(() => step = 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: switch (step) {
        0 => StartScreen(flow: flow),
        1 => StepScreen(flow: flow),
        2 => CompletionScreen(flow: flow),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
