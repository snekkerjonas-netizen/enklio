class Del03Entity {
  final String id;

  const Del03Entity({required this.id});
}

abstract class Del03Repository {
  Future<void> persist(Del03Entity entity);
  Future<Del03Entity?> load(String id);
}

abstract class Del03Service {
  Future<void> scheduleTransition(String id);
}

abstract class Del03UseCase {
  Future<void> executeTransition(String id);
}
