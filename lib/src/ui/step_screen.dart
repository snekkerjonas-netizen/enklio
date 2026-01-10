import 'package:flutter/material.dart';
import '../app/flow_coordinator.dart';
import '../features/del_05/del_05.dart';
import '../features/del_05/timer_controller.dart';
import '../features/del_05/screen_awake_controller.dart';
import '../features/del_08/del_08.dart';

class StepScreen extends StatefulWidget {
  final FlowCoordinator flow;

  const StepScreen({super.key, required this.flow});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  late final Del05Controller controller;
  final ScreenAwakeController screenAwake = ScreenAwakeController();
  StepTimer? timer;

  String currentStep = '';
  int seconds = 0;

  void showInfo(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    screenAwake.enable();

    controller = Del05Controller(
      onStepChanged: (step) {
        timer?.stop();
        timer = StepTimer(
          duration: 10,
          onTick: (s) => setState(() => seconds = s),
          onDone: () {
            showInfo('Steget kan avsluttes når du er klar');
          },
        )..start();

        Del08Store.save(step);
        setState(() {
          currentStep = step;
          seconds = 0;
        });
      },
      onFinished: () {
        timer?.stop();
        screenAwake.disable();
        Del08Store.clear();
        showInfo('Oppgaven er fullført');
        widget.flow.complete();
      },
    );

    final saved = Del08Store.load();
    if (saved != null) {
      setState(() => currentStep = saved.currentStep);
      showInfo('Gjenopptok tidligere steg');
    } else {
      controller.start();
      showInfo('Startet nytt steg');
    }
  }

  @override
  void dispose() {
    timer?.stop();
    screenAwake.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentStep,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tid: $seconds s',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: controller.next,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Neste',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
