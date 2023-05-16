import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

export 'package:dio/dio.dart';

abstract class DioClient {
  DioClient(this._dio);

  final Dio _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> post<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    BodyType bodyType = BodyType.json,
  });

  Future<Response<T>> put<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    BodyType bodyType = BodyType.json,
  });

  @visibleForTesting
  void setHeaders(Map<String, String> headers) =>
      _dio.options.headers = headers;

  @visibleForTesting
  void clearHeaders() => _dio.options.headers.clear();
}

class DioImpl extends DioClient {
  DioImpl(super.dio);

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    BodyType bodyType = BodyType.json,
  }) =>
      _dio.post(
        path,
        data: _filterBody(body, bodyType),
        queryParameters: queryParameters,
        options: options,
      );

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    BodyType bodyType = BodyType.json,
  }) =>
      _dio.put(
        path,
        data: _filterBody(body, bodyType),
        queryParameters: queryParameters,
        options: options,
      );

  dynamic _filterBody(dynamic body, BodyType bodyType) {
    if (body == null) return null;
    if (BodyType.urlencoded == bodyType) return jsonEncode(body);
    if (BodyType.form == bodyType) return FormData.fromMap(body);
    return body;
  }
}

enum BodyType { json, form, urlencoded }
