import 'package:dio/dio.dart';

import 'api_logger.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });

    ApiLogger.logRequest(
      options.method,
      options.uri.toString(),
      data: options.data,
      headers: options.headers,
    );

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ApiLogger.logResponse(
      response.statusCode,
      response.requestOptions.uri.toString(),
      response.data,
    );

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ApiLogger.logError(
      'Request failed',
      err,
      err.stackTrace,
    );

    return handler.next(err);
  }
}