import 'package:flutter/material.dart';
import '../features/task.dart';

class FlowCoordinator extends ChangeNotifier {
  final List<Task> tasks;
  int _currentIndex = -1; // -1 betyr StartScreen

  FlowCoordinator({required this.tasks});

  int get currentIndex => _currentIndex;
  Task? get currentTask => _currentIndex >= 0 && _currentIndex < tasks.length ? tasks[_currentIndex] : null;
  bool get isFinished => _currentIndex >= tasks.length;
  bool get isOnStartScreen => _currentIndex == -1;

  void start() {
    _currentIndex = 0;
    notifyListeners();
  }

  void next() {
    _currentIndex++;
    notifyListeners();
  }

  void complete() {
    _currentIndex = -1;
    notifyListeners();
  }
}