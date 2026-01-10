import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/features/del_08/del_08.dart';

class RepoSpy implements Del08Repository {
  bool called = false;

  @override
  Future<Map<String, dynamic>?> loadTemporaryProgress(String id) async => null;

  @override
  Future<void> saveTemporaryProgress(String id, Map<String, dynamic> data) async {
    called = true;
  }
}

void main() {
  test('InMemoryDel08Storage write and read', () async {
    final storage = InMemoryDel08Storage();
    final data = {'count': 1};
    await storage.write('k', data);
    final read = await storage.read('k');
    expect(read, equals(data));
  });

  test('Del08RepositoryImpl delegates to storage', () async {
    final storage = InMemoryDel08Storage();
    final repo = Del08RepositoryImpl(storage: storage);
    final data = {'a': 'b'};
    await repo.saveTemporaryProgress('id', data);
    final read = await repo.loadTemporaryProgress('id');
    expect(read, equals(data));
  });

  test('Del08UseCaseImpl calls repository', () async {
    final repoSpy = RepoSpy();
    final useCase = Del08UseCaseImpl(repository: repoSpy);
    await useCase.persistProgress('id', {'x': 1});
    expect(repoSpy.called, isTrue);
  });
}
