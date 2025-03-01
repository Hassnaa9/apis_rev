import 'package:apis_rev/core/api/api_consumer.dart';
import 'package:apis_rev/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future delete(String url, Object? data, Map<String, dynamic>? queryParameters) async
    {
      try {
      final response = await dio.delete(url, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      HandleDioExp(e);
          rethrow;
    }
    }


  @override
  Future get(String url, Object? data, Map<String, dynamic>? queryParameters) async{
     try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      HandleDioExp(e);
          rethrow;
    }
  }

  @override
  Future post(String url, Object? data, Map<String, dynamic>? queryParameters) {
    try {
      final response = dio.post(url, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      HandleDioExp(e);
          rethrow;
    }
  }

  @override
  Future put(String url, Object? data, Map<String, dynamic>? queryParameters) {
   try {
      final response = dio.put(url, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      HandleDioExp(e);
          rethrow;
    }
  }

}