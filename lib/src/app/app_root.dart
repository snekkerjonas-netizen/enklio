import 'package:flutter/material.dart';
import 'flow_coordinator.dart';

class AppRoot extends StatelessWidget {
  final FlowCoordinator flow;

  const AppRoot({super.key, required this.flow});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: flow.start,
            child: const Text('Start'),
          ),
        ),
      ),
    );
  }
}
