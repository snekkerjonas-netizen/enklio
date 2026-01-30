import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';

class StartScreen extends StatelessWidget {
  final FlowCoordinator coordinator;

  const StartScreen({super.key, required this.coordinator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dagens plan', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...coordinator.tasks.map((t) => Text('• ${t.title} (${t.duration.inMinutes} min)')),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => coordinator.start(),
                child: const Text('START ØKT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}