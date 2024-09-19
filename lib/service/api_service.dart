import 'package:challenge_app/models/models.dart';
import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio();
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 15); 
  }

  final String _baseUrl = "https://dummyjson.com/products";

  Future<Data> getProducts({int? skip, int? limit}) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          if (skip != null) "skip": skip,
          if (limit != null) "limit": limit,
        },
      );
      return Data.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout. Please try again.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Server error: ${e.response?.statusCode}');
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception('No internet connection. Please check your network.');
      } else {
        throw Exception('Something went wrong: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: ${e.toString()}');
    }
  }
}
