// ignore: avoid_web_libraries_in_flutter
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../ciss_test_exports.dart';

abstract class IApiService {
  Map<String, dynamic> header() => throw UnimplementedError();

  bool get enableMockResponse => false;

  String get token => throw UnimplementedError();

  String get baseUrl => throw UnimplementedError();

  Map<String, dynamic> get customHeaderParam => throw UnimplementedError();

  Future<ApiResponse<T>> get<T>({required ApiRequest apiRequest});

  Future<ApiResponse<T>> post<T>({required ApiRequest apiRequest});

  Future<ApiResponse<T>> put<T>({required ApiRequest apiRequest});

  Future<ApiResponse<T>> patch<T>({required ApiRequest apiRequest});

  Future<ApiResponse<T>> delete<T>({required ApiRequest apiRequest});

  Future<void> refreshToken();
}

class ApiService extends IApiService {
  final Dio _dio;
  final IConfigsService _configsService;
  final IStorageService _storage;

  ApiService(
    this._dio,
    this._configsService,
    this._storage,
  );

  ///Configura a otilizacao da api para fazer requisicao
  Future<void> prepareClient(
      {String? otherUrl,
      Map<String, dynamic>? otherHeaders,
      bool isDownload = false,
      bool forceCleanToken = false}) async {
    if (forceCleanToken) {
      await _storage.clear();
    }
    final token = forceCleanToken ? null : await _storage.getToken();
    final baseUrl = otherUrl ?? _configsService.baseUrl;
    final defaultTimezone = await GetDefaultTimezone.call();
    final language = GetSystemLocale.call();
    final headers = otherHeaders ??
        getHeaderToken(
            token: token,
            defaultTimezone: defaultTimezone,
            language: language,
            isDownload: isDownload);
    _dio.interceptors.clear();
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = headers;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = baseUrl + options.path;
      }
      final newToken = forceCleanToken ? null : await _storage.getToken();
      if (newToken != null) {
        options.headers['Authorization'] = 'Bearer $newToken';
      }
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401)) {
        await refreshToken();
        return handler.resolve(await _retry(error.requestOptions));
      }
      return handler.next(error);
    }));
  }

  static Map<String, String> getHeaderToken(
      {String? token,
      String? defaultTimezone,
      String? language,
      bool isDownload = false}) {
    if (token == null) {
      return <String, String>{
        'content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-language': language ?? '',
        'default_timezone': defaultTimezone ?? ''
      };
    } else {
      return <String, String>{
        'content-Type': 'application/json',
        'accept': isDownload ? '*' : 'application/json',
        'Authorization': 'Bearer $token',
        'Accept-language': language ?? '',
        'default_timezone': defaultTimezone ?? ''
      };
    }
  }

  @override
  Future<ApiResponse<T>> get<T>({required ApiRequest apiRequest}) async {
    await prepareClient(
        otherUrl: apiRequest.baseUrl, otherHeaders: apiRequest.headers);
    if (!apiRequest.deleteOnError ||
        (enableMockResponse && apiRequest.mockSimulate != null)) {
      return _mockSimulate(apiRequest);
    }
    try {
      final response = await _dio.get(apiRequest.path,
          queryParameters: apiRequest.queryParameters,
          onReceiveProgress: apiRequest.onSendProgress);
      return _bodySuccessOnResponse(apiRequest, response);
    } on DioError catch (error) {
      return _bodyDioErrorOnResponse(error, apiRequest);
    } on Exception catch (error) {
      return _bodyErrorOnResponse(error, apiRequest);
    }
  }

  @override
  Future<ApiResponse<T>> delete<T>({required ApiRequest apiRequest}) async {
    await prepareClient(forceCleanToken: apiRequest.forceCleanToken);
    if (!apiRequest.deleteOnError ||
        (enableMockResponse && apiRequest.mockSimulate != null)) {
      return _mockSimulate(apiRequest);
    }
    try {
      final response = await _dio.delete(apiRequest.path,
          queryParameters: apiRequest.queryParameters);

      return _bodySuccessOnResponse(apiRequest, response);
    } on DioError catch (error) {
      return _bodyDioErrorOnResponse(error, apiRequest);
    } on Exception catch (error) {
      return _bodyErrorOnResponse(error, apiRequest);
    }
  }

  @override
  Future<ApiResponse<T>> post<T>({required ApiRequest apiRequest}) async {
    await prepareClient(forceCleanToken: apiRequest.forceCleanToken);
    if (!apiRequest.deleteOnError ||
        (enableMockResponse && apiRequest.mockSimulate != null)) {
      return _mockSimulate(apiRequest);
    }
    try {
      final response = await _dio.post(apiRequest.path,
          data: apiRequest.body,
          queryParameters: apiRequest.queryParameters,
          onReceiveProgress: apiRequest.onSendProgress);
      return _bodySuccessOnResponse(apiRequest, response);
    } on DioError catch (error) {
      return _bodyDioErrorOnResponse(error, apiRequest);
    } on Exception catch (error) {
      return _bodyErrorOnResponse(error, apiRequest);
    }
  }

  @override
  Future<ApiResponse<T>> put<T>({required ApiRequest apiRequest}) async {
    await prepareClient(forceCleanToken: apiRequest.forceCleanToken);
    if (!apiRequest.deleteOnError ||
        (enableMockResponse && apiRequest.mockSimulate != null)) {
      return _mockSimulate(apiRequest);
    }
    try {
      final response = await _dio.put(apiRequest.path,
          data: apiRequest.body,
          queryParameters: apiRequest.queryParameters,
          onReceiveProgress: apiRequest.onSendProgress,
          onSendProgress: apiRequest.onReceiveProgress);
      return _bodySuccessOnResponse(apiRequest, response);
    } on DioError catch (error) {
      return _bodyDioErrorOnResponse(error, apiRequest);
    } on Exception catch (error) {
      return _bodyErrorOnResponse(error, apiRequest);
    }
  }

  @override
  Future<ApiResponse<T>> patch<T>({required ApiRequest apiRequest}) async {
    await prepareClient(forceCleanToken: apiRequest.forceCleanToken);
    if (!apiRequest.deleteOnError ||
        (enableMockResponse && apiRequest.mockSimulate != null)) {
      return _mockSimulate(apiRequest);
    }
    try {
      final response = await _dio.patch(apiRequest.path,
          data: apiRequest.body,
          queryParameters: apiRequest.queryParameters,
          onReceiveProgress: apiRequest.onSendProgress,
          onSendProgress: apiRequest.onReceiveProgress);
      return _bodySuccessOnResponse(apiRequest, response);
    } on DioError catch (error) {
      return _bodyDioErrorOnResponse(error, apiRequest);
    } on Exception catch (error) {
      return _bodyErrorOnResponse(error, apiRequest);
    }
  }

  @override
  Map<String, dynamic> header({String token = ''}) {
    final header = token.isEmpty
        ? <String, dynamic>{'content-type': 'application/json;charset=utf-8'}
        : <String, dynamic>{
            'content-type': 'application/json;charset=utf-8',
            'Authorization': 'Bearer $token',
          };
    header.addAll(customHeaderParam);
    return header;
  }

  ApiResponse<T> _bodyErrorOnResponse<T>(
      Exception error, ApiRequest apiRequest) {
    final response =
        ApiResponse<T>(statusCode: 500, errorBody: error, request: apiRequest);
    return response;
  }

  ApiResponse<T> _bodyDioErrorOnResponse<T>(
      DioError error, ApiRequest apiRequest) {
    final response = ApiResponse<T>(
        statusCode: error.response?.statusCode ?? 500,
        errorBody: error.response?.data ??
            error.error ??
            error.message ??
            error.stackTrace,
        request: apiRequest);
    return response;
  }

  ApiResponse<T> _bodySuccessOnResponse<T>(
      ApiRequest apiRequest, Response<dynamic> response) {
    // ignore: prefer_typing_uninitialized_variables
    var resultData;
    try {
      if (apiRequest.tryParse != null) {
        resultData = apiRequest.tryParse?.call(response.data) as T?;
      } else {
        resultData = response.data;
      }
    } catch (e) {
      resultData = response.data;
    }
    if (resultData is T) {
      return ApiResponse<T>(
          statusCode: response.statusCode ?? 500,
          body: response.data,
          token:
              response.headers['authorization']?[0].replaceAll('Bearer ', ''),
          request: apiRequest);
    } else {
      return ApiResponse<T>(
          statusCode: response.statusCode ?? 500, errorBody: response.data);
    }
  }

  ApiResponse<T> _mockSimulate<T>(ApiRequest apiRequest) {
    debugPrint(
        '================================Request simulated=======================================================');
    debugPrint('Path simulated => ${apiRequest.path}');
    debugPrint('Body simulated => ${apiRequest.mockSimulate?.body}');
    debugPrint(
        '================================Request simulated=======================================================');
    // ignore: prefer_typing_uninitialized_variables
    var resultData;
    if (apiRequest.tryParse != null) {
      resultData =
          apiRequest.tryParse?.call(apiRequest.mockSimulate?.body ?? {}) as T?;
    } else {
      resultData = apiRequest.mockSimulate?.body ?? {};
    }
    if (resultData is T) {
      return ApiResponse<T>(
          statusCode: apiRequest.mockSimulate?.statusCode ?? 500,
          body: resultData,
          errorBody: apiRequest.mockSimulate?.errorBody,
          request: apiRequest);
    } else {
      return ApiResponse<T>(
        statusCode: apiRequest.mockSimulate?.statusCode ?? 500,
        errorBody: resultData,
        request: apiRequest,
      );
    }
  }

  @override
  Future<void> refreshToken() async {
    final defaultTimezone = await GetDefaultTimezone.call();
    final language = GetSystemLocale.call();
    final headers = getHeaderToken(
        token: null, defaultTimezone: defaultTimezone, language: language);
    _dio.options.headers = headers;
    final refreshToken = await _storage.getRefreshToken();
    final response = await _dio.post('${_configsService.baseUrl}/auth/refresh/',
        data: {"refresh": refreshToken});

    if (response.statusCode == 201 || response.statusCode == 200) {
      await _storage.setToken(token: response.data['access']);
    } else {
      await _storage.setToken(token: null);
      _storage.clear();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
