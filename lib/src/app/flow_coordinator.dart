import 'package:flutter/material.dart';
import '../features/task.dart';
import '../models/app_view.dart';

class FlowCoordinator extends ChangeNotifier {
  final List<Task> tasks;
  int _currentIndex = -1; // -1 betyr StartScreen
  AppView _currentView = AppView.steps; // Default view for simple flow

  FlowCoordinator({required this.tasks});

  int get currentIndex => _currentIndex;
  Task? get currentTask => _currentIndex >= 0 && _currentIndex < tasks.length ? tasks[_currentIndex] : null;
  bool get isFinished => _currentIndex >= tasks.length;
  bool get isOnStartScreen => _currentIndex == -1;
  AppView get currentView => _currentView;

  void start() {
    _currentIndex = 0;
    _currentView = AppView.steps;
    notifyListeners();
  }

  void next() {
    _currentIndex++;
    if (isFinished) {
      _currentView = AppView.completion;
    }
    notifyListeners();
  }

  void complete() {
    _currentIndex = -1;
    _currentView = AppView.steps;
    notifyListeners();
  }

  void setView(AppView view) {
    _currentView = view;
    notifyListeners();
  }
}