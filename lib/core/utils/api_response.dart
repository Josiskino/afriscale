import 'package:dio/dio.dart';

import 'api_logger.dart';

class ApiResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;
  final Map<String, dynamic>? errors;

  const ApiResponse._({
    this.data,
    this.message,
    this.statusCode,
    this.success = false,
    this.errors,
  });

  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse._(
      data: data,
      message: message,
      success: true,
      statusCode: 200,
    );
  }

  factory ApiResponse.error(String message, [int? statusCode, Map<String, dynamic>? errors]) {
    return ApiResponse._(
      message: message,
      statusCode: statusCode,
      success: false,
      errors: errors,
    );
  }

    factory ApiResponse.fromResponse(
    Response response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final statusCode = response.statusCode;
      final responseData = response.data;

      if (statusCode == null || statusCode < 200 || statusCode >= 300) {
        if (responseData is Map<String, dynamic>) {
          final message = responseData['message'] ?? 
                         responseData['error'] ?? 
                         _getMessageForStatusCode(statusCode ?? 500);
          final errors = responseData['errors'] as Map<String, dynamic>?;
          
          return ApiResponse.error(message, statusCode, errors);
        }
        return ApiResponse.error(_getMessageForStatusCode(statusCode ?? 500), statusCode);
      }

      if (responseData is! Map<String, dynamic>) {
        return ApiResponse.error('Invalid response format', statusCode);
      }

      final data = fromJson(responseData['data'] ?? responseData);
      final message = responseData['message'] as String?;
      return ApiResponse.success(data, message: message);
      
    } on FormatException catch (e, stackTrace) {
      ApiLogger.logError('Format error parsing response', e, stackTrace);
      return ApiResponse.error('Invalid data format');
      
    } catch (e, stackTrace) {
      ApiLogger.logError('Error parsing response', e, stackTrace);
      return ApiResponse.error(e.toString());
    }
  }

  bool get hasErrors => errors != null && errors!.isNotEmpty;
  
  List<String> getFieldErrors(String field) {
    if (!hasErrors) return [];
    return (errors![field] as List?)?.cast<String>() ?? [];
  }

  static String _getMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
        return 'Request successful';
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 409:
        return 'Conflict';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      case 504:
        return 'Gateway timeout';
      default:
        return 'Unknown error';
    }
  }
}