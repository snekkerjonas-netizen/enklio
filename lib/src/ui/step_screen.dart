import 'dart:async';
import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';
import '../features/task.dart';

class StepScreen extends StatefulWidget {
  final Task task;
  final VoidCallback onCompleted;

  const StepScreen({super.key, required this.task, required this.onCompleted});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  late int _timeLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.task.duration.inSeconds + widget.task.bufferDuration.inSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.task.title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            Text(
              '${(_timeLeft ~/ 60).toString().padLeft(2, '0')}:${(_timeLeft % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: _timeLeft == 0 ? widget.onCompleted : null,
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 60)),
              child: const Text('NESTE'),
            ),
          ],
        ),
      ),
    );
  }
}