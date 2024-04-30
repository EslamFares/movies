import 'package:dio/dio.dart';
import 'package:movies/core/network/api/api_consts.dart';
import 'package:movies/core/network/api/api_consumer.dart';
import 'package:movies/core/network/api/api_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends ApiConsumer {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiConsts.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(ApiInterceptor());
  }
  @override
  Future get(
      {required String path,
      Map<String, dynamic>? query,
      Object? data,
      Map<String, String>? headers,
      String? contentType}) async {
    final response = await dio.get(path,
        queryParameters: query,
        data: data,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: headers,
        ));
    return response.data;
  }

  @override
  Future delete(
      {required String path,
      Map<String, dynamic>? query,
      dynamic data,
      bool isFormData = false,
      Map<String, String>? headers,
      String? contentType}) async {
    final response = await dio.delete(path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: query,
        options: Options(
            contentType: contentType ?? 'application/json', headers: headers));
    return response.data;
  }

  @override
  Future patch(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      dynamic data,
      bool isFormData = false,
      String? contentType}) async {
    final response = await dio.patch(path,
        queryParameters: query,
        data: isFormData ? FormData.fromMap(data) : data,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: headers,
        ));
    return response.data;
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      dynamic data,
      bool isFormData = false,
      String? contentType}) async {
    final response = await dio.post(path,
        queryParameters: query,
        data: isFormData ? FormData.fromMap(data) : data,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: headers,
        ));
    return response.data;
  }
}
