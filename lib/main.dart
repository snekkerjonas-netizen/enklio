import 'package:flutter/material.dart';
import 'src/app/app_root.dart';
import 'src/app/flow_coordinator.dart';
import 'src/features/del_01/del_01.dart';
import 'src/features/del_02/del_02.dart';
import 'src/features/del_03/del_03.dart';
import 'src/features/del_04/del_04.dart';
import 'src/features/del_05/del_05.dart';
import 'src/features/del_06/del_06.dart';
import 'src/features/del_07/del_07.dart';
import 'src/features/del_08/del_08.dart';

void main() {
  final flow = FlowCoordinator(
    del01: Del01UseCaseImpl(),
    del02: Del02UseCaseImpl(),
    del03: Del03UseCaseImpl(),
    del04: Del04UseCaseImpl(),
    del05: Del05UseCaseImpl(),
    del06: Del06UseCaseImpl(),
    del07: Del07UseCaseImpl(),
    del08: Del08UseCaseImpl(),
  );

  runApp(AppRoot(flow: flow));
}
