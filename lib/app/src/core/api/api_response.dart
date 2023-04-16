import 'api_request.dart';

class ApiResponse<T> {
  const ApiResponse(
      {this.request,
      this.statusCode,
      this.bodyBytes,
      this.bodyString,
      this.statusText = '',
      this.headers = const {},
      this.body,
      this.errorBody,
      this.token});

  final ApiRequest? request;
  final Map<String, String>? headers;
  final int? statusCode;
  final String? statusText;
  final Stream<List<int>>? bodyBytes;
  final String? bodyString;
  final T? body;
  final dynamic errorBody;

  final String? token;
}
