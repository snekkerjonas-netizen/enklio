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
    del01.start();
  }

  /// Kalles når Del 1 er ferdig
  void onDel01Completed() {
    del02.start();
  }

  /// Kalles når Del 2 er ferdig
  void onDel02Completed() {
    del03.start();
  }

  /// Kalles når Del 3 er ferdig
  void onDel03Completed() {
    del04.start();
  }

  /// Kalles når Del 4 er ferdig og klar til gjennomføring
  void onDel04Completed() {
    del05.start();
  }

  /// Kalles når stegvis gjennomføring er ferdig
  void onDel05Completed() {
    del06.complete();
  }

  /// Kalles når avslutning er ferdig
  void onDel06Completed() {
    del07.triggerAutoReturn();
  }

  /// Kalles når retur til start er ferdig
  void onDel07Completed() {
    del08.clearTemporaryProgress();
  }
}
