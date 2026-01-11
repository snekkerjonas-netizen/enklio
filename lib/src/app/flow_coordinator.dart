class FlowCoordinator {
  late void Function() onStart;
  late void Function() onNext;
  late void Function() onComplete;

  void start() => onStart();
  void next() => onNext();
  void complete() => onComplete();
}
