import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../../../../ciss_test_exports.dart';

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

  factory ErrorResponse.fromResponse(ApiResponse response, {String? itemId}) {
    dynamic error;
    if (response.statusCode == 500) {
      error = response.errorBody as String;
      LineSplitter ls = const LineSplitter();
      final message = ls.convert(error?.message ?? '');
      return ErrorResponse(
          message: message[0],
          detail: "${message[1]} ${message[2]}"
              .replaceAll('[', '')
              .replaceAll(']', ''),
          statusCode: response.statusCode.toString(),
          itemId: itemId);
    } else {
      final errors = response.errorBody as Map<String, dynamic>;
      final message = errors.keys.toList()[0];
      final details = errors.values.toList()[0];
      return ErrorResponse(
          message: message,
          detail: details.toString().replaceAll('[', '').replaceAll(']', ''),
          statusCode: response.statusCode.toString(),
          itemId: itemId);
    }
  }

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}

class EmptyResponse extends Failure {
  const EmptyResponse(
      {String? message, String? statusCode, String? detail, String? itemId})
      : super(message, statusCode, detail, itemId);
  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}

class InternalError extends Failure {
  const InternalError(
      {String? message, String? statusCode, String? detail, String? itemId})
      : super(message, statusCode, detail, itemId);

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}

class InvalidCepError extends Failure {
  const InvalidCepError(
      {String? message, String? statusCode, String? detail, String? itemId})
      : super(message, "400", detail, itemId);

  @override
  List<Object?> get props => [message, statusCode];

  @override
  bool? get stringify => true;
}
