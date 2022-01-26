import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  const AppException([this.message, this.prefix, this.url]);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class BadRequestException extends AppException {
  const BadRequestException({String? message, String? url})
      : super(message, 'Bad Request', url);
}

class FetchDataException extends AppException {
  const FetchDataException({String? message, String? url})
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingException extends AppException {
  const ApiNotRespondingException({String? message, String? url})
      : super(message, 'Api not responded in time', url);
}

class UnAuthorizedException extends AppException {
  const UnAuthorizedException({String? message, String? url})
      : super(message, 'UnAuthorized request', url);
}

class NoConnectionException extends AppException {
  const NoConnectionException({String? message, String? url})
      : super(message, 'No connection', url);
}
