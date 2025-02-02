import 'package:dio/dio.dart';

import '../abstract/api_client_interface.dart';
import '../utils/api_response.dart';
import '../utils/api_response_exception.dart';
import '../utils/custom_interceptor.dart';

class DioClient implements ApiClientInterface {
  final Dio _dio;
  String? _authToken;

  DioClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.interceptors.add(CustomInterceptors());
  }

  @override
  void setAuthToken(String token) {
    _authToken = token;
  }

  Options _defaultOptions() {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        if (_authToken != null) 'Authorization': 'Bearer $_authToken',
      },
    );
  }

  @override
  Future<ApiResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _defaultOptions()..method = method.value,
      );

      return ApiResponse.fromResponse(response, fromJson);
    } on DioException catch (e, stackTrace) {
      throw ApiException(
        message: e.message ?? 'Request failed',
        statusCode: e.response?.statusCode,
        data: e.response?.data,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<ApiResponse<T>> upload<T>({
    required String path,
    required String filePath,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        path,
        data: formData,
        options: _defaultOptions(),
      );

      return ApiResponse.fromResponse(response, fromJson);
    } on DioException catch (e, stackTrace) {
      throw ApiException(
        message: e.message ?? 'Upload failed',
        statusCode: e.response?.statusCode,
        data: e.response?.data,
        stackTrace: stackTrace,
      );
    }
  }
}