import 'package:equatable/equatable.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  // static ErrorObject mapFailureToErrorObject({required Failure failure}) {
  //   return ErrorObject(title: failure.title, message: failure.message);
  // }
}
