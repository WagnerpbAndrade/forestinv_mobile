import 'package:forestinv_mobile/app/core/exceptions/failure.dart';

class NoDataFound extends Failure {}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection()
      : super(errorMessage: 'Verifique sua conexão com a internet');
}

class SaveProjectNoInternetConnection extends NoInternetConnection {}

class SaveProjectError extends Failure {
  SaveProjectError(
    StackTrace stackTrace,
    String label,
    dynamic exception,
    String errorMessage,
  ) : super(
          stacktrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
