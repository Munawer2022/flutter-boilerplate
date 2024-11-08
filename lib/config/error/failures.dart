abstract class Failure {
  final String error;
  const Failure(this.error);
}

class ServerFailure extends Failure {
  const ServerFailure(String error) : super(error);
} 