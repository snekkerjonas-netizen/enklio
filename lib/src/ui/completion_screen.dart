import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';

class CompletionScreen extends StatelessWidget {
  final FlowCoordinator flow;

  const CompletionScreen({super.key, required this.flow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: flow.complete,
          child: const Text('Ferdig'),
        ),
      ),
    );
  }
}
