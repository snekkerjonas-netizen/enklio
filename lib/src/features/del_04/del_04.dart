class Del04Entity {
  final String id;

  const Del04Entity({required this.id});
}

abstract class Del04Validator {
  Future<bool> validate(Del04Entity entity);
}

abstract class Del04Repository {
  Future<void> prepare(Del04Entity entity);
}

abstract class Del04UseCase {
  Future<void> prepareForStart(String id);
}
