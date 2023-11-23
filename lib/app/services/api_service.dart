import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../modules/widgets/custom_snack_bar.dart';

class ApiService {
  static final Dio _dio = Dio(
      BaseOptions(
          headers: {
            'Content-Type' : 'application/json',
            'Accept' : 'application/json'
          }
      )
  );

  // request timeout (default 10 seconds)
  static const int _timeoutInSeconds = 10;

  /// dio getter (used for testing)
  static get dio => _dio;

  /// perform safe api request
  static getApi(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        required Function(Response response) onSuccess,
        Function()? onError,
      }) async {
    try {
      late Response response;
        response = await _dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
      await onSuccess(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      _handleError(error.message ?? "Something went wrong");
    } on SocketException {
      _handleError("No internet connection");
    } on TimeoutException {
      _handleError("Connection timed out!");
    } catch (error, stackTrace) {
      Logger().e(stackTrace);
      _handleError(error.toString());
    }
  }

  static _handleError(String msg) {
    CustomSnackBar.showCustomErrorToast(message: msg);
  }
}
