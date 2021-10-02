import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomNetworkException extends DioError {
  CustomNetworkException(RequestOptions requestOptions, Response? response)
      : super(
          requestOptions: requestOptions,
        ) {
    debugPrint('${response?.statusMessage} ${response?.statusCode} $message');
  }
}
