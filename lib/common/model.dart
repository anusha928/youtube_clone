import 'package:flutter/foundation.dart';

class DataResponse<T> {
  String message;
  T? data;
  bool status;

  DataResponse({required this.message, this.data, required this.status});

  factory DataResponse.error({required String message}) {
    return DataResponse(message: message, status: false, data: null);
  }

  factory DataResponse.success({ required T data}) {
    return DataResponse(message: "", status: true, data: data);
  }
}
