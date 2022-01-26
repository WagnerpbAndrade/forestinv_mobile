abstract class Failure {
  final String title;
  final String message;

  Failure(this.title, this.message);
}

class ApiNotRespondingFailure extends Failure {
  ApiNotRespondingFailure({required String title, required String message})
      : super(title, message);
}

class NoConnectionFailure extends Failure {
  NoConnectionFailure({required String title, required String message})
      : super(title, message);
}
