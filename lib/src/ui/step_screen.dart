import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';

class StepScreen extends StatelessWidget {
  final FlowCoordinator flow;

  const StepScreen({super.key, required this.flow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: flow.stepDone,
          child: const Text('Neste steg'),
        ),
      ),
    );
  }
}
