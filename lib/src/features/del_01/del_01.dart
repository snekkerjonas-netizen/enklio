class Del01Entity {
  final String id;

  const Del01Entity({required this.id});
}

abstract class Del01Repository {
  Future<void> save(Del01Entity entity);
  Future<Del01Entity?> getById(String id);
}

abstract class Del01DataSource {
  Future<Map<String, dynamic>> fetch(String id);
}

abstract class Del01UseCase {
  Future<void> execute(Del01Entity entity);
}
