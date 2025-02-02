import '../utils/api_response.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch;

  String get value => name.toUpperCase();
}

abstract class ApiClientInterface {
  Future<ApiResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<ApiResponse<T>> upload<T>({
    required String path,
    required String filePath,
    required T Function(Map<String, dynamic>) fromJson,
  });

  void setAuthToken(String token);
}