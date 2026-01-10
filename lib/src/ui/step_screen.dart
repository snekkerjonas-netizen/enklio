import 'package:flutter/material.dart';

class StepScreen extends StatelessWidget {
  final String stepText;
  final VoidCallback onNext;

  const StepScreen({
    super.key,
    required this.stepText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(stepText, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Neste'),
            ),
          ],
        ),
      ),
    );
  }
}
