import 'dart:async';

import '../../../../ciss_test_exports.dart';

class ApiRequest {
  const ApiRequest(
      {required this.path,
      this.baseUrl,
      this.body = const {},
      this.cancelToken,
      this.queryParameters = const {},
      this.deleteOnError = true,
      this.onReceiveProgress,
      this.onSendProgress,
      this.tryParse,
      this.mockSimulate,
      this.headers = const {},
      this.forceCleanToken = false});

  final String path;
  final String? baseUrl;
  final dynamic body;
  final Map<String, dynamic> queryParameters;
  final Completer? cancelToken;
  final bool deleteOnError;
  final Map<String, String>? headers;
  final dynamic Function(Map<String, dynamic> map)? tryParse;
  final Function(int count, int total)? onSendProgress;
  final Function(int count, int total)? onReceiveProgress;
  final ApiResponse? mockSimulate;
  final bool forceCleanToken;
}
