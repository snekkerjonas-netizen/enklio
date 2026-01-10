class Del06Entity {
  final String id;

  const Del06Entity({required this.id});
}

abstract class Del06Repository {
  Future<void> finalize(Del06Entity entity);
  Future<Map<String, dynamic>> exportResult(String id);
}

abstract class Del06UseCase {
  Future<void> complete(String id);
}
