import 'package:flutter/material.dart';

abstract class Failure {
  final String errorMessage;

  Failure({
    StackTrace? stacktrace,
    String? label,
    dynamic exception,
    this.errorMessage = '',
  }) {
    if (stacktrace != null) {
      debugPrintStack(label: label, stackTrace: stacktrace);
    }
    //Lançar exceção para analytics
  }
}

class UnknowError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stacktrace;
  final String? label;

  UnknowError({
    required this.errorMessage,
    this.exception,
    this.stacktrace,
    this.label,
  }) : super(
          stacktrace: stacktrace,
          label: label,
          exception: exception,
        );
}
