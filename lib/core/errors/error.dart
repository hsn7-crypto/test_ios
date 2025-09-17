abstract class Failure {
  final String message;

  Failure({required this.message});
}

class LocalFailure extends Failure {
  LocalFailure({required super.message});
}

class EmptyFailure extends Failure {
  EmptyFailure({required super.message});
}
