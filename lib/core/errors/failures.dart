abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

// Subclasses de erro específicas que a UI vai entender
class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
