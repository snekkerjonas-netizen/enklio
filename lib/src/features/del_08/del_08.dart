class Del08Entity {
  final String id;

  const Del08Entity({required this.id});
}

abstract class Del08Repository {
  Future<void> saveTemporaryProgress(String id, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> loadTemporaryProgress(String id);
}

abstract class Del08Storage {
  Future<void> write(String key, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> read(String key);
}

abstract class Del08UseCase {
  Future<void> persistProgress(String id, Map<String, dynamic> data);
}

class InMemoryDel08Storage implements Del08Storage {
  final Map<String, Map<String, dynamic>> _store = {};

  @override
  Future<void> write(String key, Map<String, dynamic> data) async {
    _store[key] = Map<String, dynamic>.from(data);
  }

  @override
  Future<Map<String, dynamic>?> read(String key) async {
    final v = _store[key];
    return v == null ? null : Map<String, dynamic>.from(v);
  }
}

class Del08RepositoryImpl implements Del08Repository {
  final Del08Storage storage;

  Del08RepositoryImpl({required this.storage});

  @override
  Future<void> saveTemporaryProgress(String id, Map<String, dynamic> data) async {
    await storage.write(id, data);
  }

  @override
  Future<Map<String, dynamic>?> loadTemporaryProgress(String id) async {
    return storage.read(id);
  }
}

class Del08UseCaseImpl implements Del08UseCase {
  final Del08Repository repository;

  Del08UseCaseImpl({required this.repository});

  @override
  Future<void> persistProgress(String id, Map<String, dynamic> data) async {
    await repository.saveTemporaryProgress(id, data);
  }
}
