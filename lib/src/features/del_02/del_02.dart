class Del02Entity {
  final String id;

  const Del02Entity({required this.id});
}

abstract class Del02Repository {
  Future<void> store(Del02Entity entity);
  Future<Del02Entity?> fetchById(String id);
}

abstract class Del02DataSource {
  Future<Map<String, dynamic>> transform(Map<String, dynamic> input);
}

abstract class Del02UseCase {
  Future<Del02Entity?> execute(String id);
}
