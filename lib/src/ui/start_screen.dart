import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';

class StartScreen extends StatelessWidget {
  final FlowCoordinator flow;

  const StartScreen({super.key, required this.flow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: flow.start,
          child: const Text('Start'),
        ),
      ),
    );
  }
}
