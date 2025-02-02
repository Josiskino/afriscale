import 'package:logger/logger.dart';

class ApiLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart
    ),
  );

  static void logRequest(String method, String url, {dynamic data, Map<String, dynamic>? headers}) {
    _logger.i('➡️ $method REQUEST to $url',
        error: data != null ? {'body': data, 'headers': headers} : {'headers': headers});
  }

  static void logResponse(int? statusCode, String url, dynamic data) {
    _logger.i('⬅️ Response from $url (Status: $statusCode)',
        error: {'body': data});
  }

  static void logError(String message, dynamic error, StackTrace? stackTrace) {
    _logger.e('❌ $message', error: error, stackTrace: stackTrace);
  }
}