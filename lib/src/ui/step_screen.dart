import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';

class StepScreen extends StatefulWidget {
  final FlowCoordinator flow;

  const StepScreen({super.key, required this.flow});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  final List<String> steps = [
    'Gjør klar arbeidsområdet',
    'Utfør hovedoppgaven',
    'Rydd opp',
  ];

  int index = 0;

  void nextStep() {
    if (index < steps.length - 1) {
      setState(() => index++);
    } else {
      widget.flow.complete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              steps[index],
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: nextStep,
              child: Text(index < steps.length - 1 ? 'Neste' : 'Ferdig'),
            ),
          ],
        ),
      ),
    );
  }
}
