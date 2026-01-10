import 'package:flutter_test/flutter_test.dart';
import 'package:enklio/src/features/del_07/del_07.dart';

void main() {
  test('InMemoryDel07Repository marks reset', () async {
    final repo = InMemoryDel07Repository();
    await repo.markReset('x');
    final was = await repo.wasReset('x');
    expect(was, isTrue);
  });

  test('Del07ServiceImpl.resetState is callable', () async {
    final service = Del07ServiceImpl();
    await service.resetState();
    expect(true, isTrue);
  });

  test('Del07UseCaseImpl triggers service and repository', () async {
    final serviceSpy = _ServiceSpy();
    final repoSpy = _RepoSpy();
    final useCase = Del07UseCaseImpl(service: serviceSpy, repository: repoSpy);

    await useCase.triggerAutoReturn();

    expect(serviceSpy.called, isTrue);
    expect(repoSpy.last, 'auto');
  });
}

class _ServiceSpy implements Del07Service {
  bool called = false;

  @override
  Future<void> resetState() async {
    called = true;
  }
}

class _RepoSpy implements Del07Repository {
  String? last;

  @override
  Future<void> markReset(String id) async {
    last = id;
  }
}
