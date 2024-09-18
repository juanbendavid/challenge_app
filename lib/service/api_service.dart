import 'package:challenge_app/models/models.dart';
import 'package:dio/dio.dart';

class ApiService{
  late final Dio _dio;
  ApiService() {
    _dio = Dio();
    _dio.options.receiveDataWhenStatusError = true;
  }
  final String _baseUrl = "https://dummyjson.com/products";

  Future<Data> listarFacturas({
    int? skip,
    int? limit,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          if (skip != null) "skip": skip,
          if (limit != null) "limit": limit,
        },
      );
      final dataResponse = Data.fromJson(response.data);
      return dataResponse;
    } on DioException catch (e) {
      throw e;
    }
  }
}