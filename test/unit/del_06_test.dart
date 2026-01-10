import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/features/del_06/del_06.dart';

class StubRepo implements Del06Repository {
  @override
  Future<void> finalize(Del06Entity entity) async {}

  @override
  Future<Map<String, dynamic>> exportResult(String id) async => {};
}

class StubUseCase implements Del06UseCase {
  @override
  Future<void> complete(String id) async {}
}

void main() {
  test('can create Del06Entity', () {
    final e = Del06Entity(id: '1');
    expect(e.id, '1');
  });

  test('Del06Repository and Del06UseCase signatures compile with stubs', () async {
    final repo = StubRepo();
    final useCase = StubUseCase();

    await repo.finalize(Del06Entity(id: '1'));
    final res = await repo.exportResult('1');
    await useCase.complete('1');

    expect(res, isA<Map<String, dynamic>>());
  });
}
