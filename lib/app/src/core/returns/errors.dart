// coverage:ignore-file
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String? message;
  final String? statusCode;
  final String? detail;
  final String? itemId;

  const Failure(this.message, this.statusCode, this.detail, this.itemId);
}

class ErrorResponse extends Failure {
  const ErrorResponse(
      {String? message, String? detail, String? statusCode, String? itemId})
      : super(message, statusCode, detail, itemId);

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}
