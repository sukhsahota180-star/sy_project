import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://sy-projects.vercel.app',
  );

  static const String appName = 'SY Projects';
  static const String appTagline = 'Digital products that grow brands';
  static const String supportEmail = 'sukhsahota180@gmail.com';
  static const String supportPhone = '+91 8437 584 541';

  static const String firebaseProjectId = 'sy-projects';
  static const String firebaseWebApiKey = 'YOUR_WEB_API_KEY';
  static const String firebaseWebAppId = 'YOUR_WEB_APP_ID';
  static const String firebaseMessagingSenderId = 'YOUR_MESSAGING_SENDER_ID';
}

final loggerProvider = Provider<Logger>((ref) => Logger());

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(
    LoggingInterceptor(ref.watch(loggerProvider)),
  );

  return dio;
});

class LoggingInterceptor extends Interceptor {
  final Logger logger;

  LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('REQUEST: ${options.method} ${options.path}');
    if (options.data != null) {
      logger.i('Data: ${options.data}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('RESPONSE: ${response.statusCode} ${response.requestOptions.path}');
    logger.i('Data: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('ERROR: ${err.message}');
    logger.e('Error: ${err.error}');
    return super.onError(err, handler);
  }
}
