import '../features/del_01/del_01.dart';
import '../features/del_02/del_02.dart';
import '../features/del_03/del_03.dart';
import '../features/del_04/del_04.dart';
import '../features/del_05/del_05.dart';
import '../features/del_06/del_06.dart';
import '../features/del_07/del_07.dart';
import '../features/del_08/del_08.dart';

class FlowCoordinator {
  final Del01UseCase del01;
  final Del02UseCase del02;
  final Del03UseCase del03;
  final Del04UseCase del04;
  final Del05UseCase del05;
  final Del06UseCase del06;
  final Del07UseCase del07;
  final Del08UseCase del08;

  FlowCoordinator({
    required this.del01,
    required this.del02,
    required this.del03,
    required this.del04,
    required this.del05,
    required this.del06,
    required this.del07,
    required this.del08,
  });

  /// Starter hele flyten
  void start() {
    // Del01 expects an entity-based execute
    del01.execute(Del01Entity(id: 'auto'));
  }

  /// Kalles når Del 1 er ferdig
  class FlowCoordinator {
    final void Function() onStart;
    final void Function() onNext;
    final void Function() onComplete;

    FlowCoordinator({
      required this.onStart,
      required this.onNext,
      required this.onComplete,
    });

    void start() => onStart();
    void next() => onNext();
    void complete() => onComplete();
  }
  }
