import 'package:flutter/material.dart';

class CompletionScreen extends StatelessWidget {
  final VoidCallback onDone;

  const CompletionScreen({
    super.key,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: onDone,
          child: const Text('Ferdig'),
        ),
      ),
    );
  }
}
