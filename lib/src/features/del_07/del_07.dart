class Del07Entity {
  final String id;

  const Del07Entity({required this.id});
}

abstract class Del07Service {
  Future<void> resetState();
}

abstract class Del07Repository {
  Future<void> markReset(String id);
}

abstract class Del07UseCase {
  Future<void> triggerAutoReturn();
}

class InMemoryDel07Repository implements Del07Repository {
  final Set<String> _resets = {};

  @override
  Future<void> markReset(String id) async {
    _resets.add(id);
  }

  Future<bool> wasReset(String id) async => _resets.contains(id);
}

class Del07ServiceImpl implements Del07Service {
  @override
  Future<void> resetState() async {
    // Intentionally no-op: service contract only
  }
}

class Del07UseCaseImpl implements Del07UseCase {
  final Del07Service service;
  final Del07Repository repository;

  Del07UseCaseImpl({required this.service, required this.repository});

  @override
  Future<void> triggerAutoReturn() async {
    await service.resetState();
    await repository.markReset('auto');
  }
}
