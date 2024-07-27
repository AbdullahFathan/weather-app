import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  static String getCustomException(error) {
    debugPrint("Get Exception: ${error.toString()}");

    if (error is Exception) {
      String msg;
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
            msg = 'Connection Timeout';
            break;
          case DioExceptionType.sendTimeout:
            msg = 'Send Timeout';
            break;
          case DioExceptionType.receiveTimeout:
            msg = 'Receive Timeout';
            break;
          case DioExceptionType.cancel:
            msg = 'Request Cancel';
            break;
          case DioExceptionType.badResponse:
            switch (error.response?.statusCode) {
              case 400:
                msg = 'Bad Request';
                break;
              case 401:
                msg = 'Unauthorised Request';
                break;
              case 403:
                msg = 'Unauthorised Request';
                break;
              case 404:
                msg = 'Not Found';
                break;
              case 405:
                msg = 'Method Not Allowed';
                break;
              case 406:
                msg = 'Not Acceptable';
                break;
              case 409:
                msg = 'Conflict';
                break;
              case 408:
                msg = 'Request Timeout';
                break;
              case 500:
                msg = 'Server Eror';
                break;
              case 503:
                msg = 'Service Unavailable';
                break;
              default:
                final responseCode = error.response?.statusCode;
                final message = error.response?.statusMessage;
                msg = "Received invalid status code: $responseCode $message";
            }

            break;
          default:
            msg = error.message?.toString() ?? error.error.toString();
            break;
        }
      } else if (error is FormatException) {
        msg = 'Format Exception';
      } else if (error is SocketException) {
        msg = 'No Internet';
      } else {
        msg = 'Something went wrong';
      }
      return 'Eror = $msg';
    } else if (error.toString().contains("is not a subtype of")) {
      return 'Wrong Type Data';
    } else {
      return error.toString();
    }
  }
}

extension FutureExt<T> on Future<T> {
  Future<T> safeError() {
    return catchError((error) async {
      throw ErrorHandler.getCustomException(error);
    });
  }
}
