import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio_exceptions.dart';
import 'local_storage_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(Dio(), ref.watch(localStorageProvider));
});

class ApiService {
  final Dio _dioClient;
  final LocalStorageService _localStorageService;

  ApiService(this._dioClient, this._localStorageService) {
    _dioClient.options = BaseOptions(
      baseUrl: "http://meditative.aculabs.in/api",
      responseType: ResponseType.json,
      connectTimeout: 8000,
      receiveTimeout: 8000,
      sendTimeout: 8000,
    );
    _dioClient.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<dynamic> postRequest(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    bool headersRequired = false,
  }) async {
    try {
      final response = await _dioClient.post(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          headers: headersRequired
              ? {
                  HttpHeaders.authorizationHeader:
                      "Bearer ${await _localStorageService.getToken()}",
                }
              : null,
        ),
      );
      final jsonResponse = response.data;
      final success = jsonResponse["StatusCode"] == 1;
      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse["Message"] ?? "An Error Occured!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getRequest(
    String path, {
    Map<String, dynamic>? params,
    bool headersRequired = false,
  }) async {
    try {
      final response = await _dioClient.get(
        path,
        queryParameters: params,
        options: Options(
          headers: headersRequired
              ? {
                  HttpHeaders.authorizationHeader:
                      "Bearer ${await _localStorageService.getToken()}",
                }
              : null,
        ),
      );
      final jsonResponse = response.data;
      final success = jsonResponse["StatusCode"] == 1;
      if (success) {
        return jsonResponse;
      } else {
        final String message = jsonResponse["Message"] ?? "An Error Occured!";
        return Future.error(message);
      }
    } on DioError catch (error) {
      throw DioExceptions.fromDioError(error);
    } catch (e) {
      rethrow;
    }
  }
}
