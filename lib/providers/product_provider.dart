import 'package:challenge_app/models/models.dart';
import 'package:challenge_app/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _products = [];
  List<Product> get products => _products;

  Future<List<Product>> fetchProducts() async {
    try {
      final data = await _apiService.listarFacturas();
      _products = data.products;
      return _products;
      notifyListeners();
    } on DioException catch (e) {
      throw e;
    }
  }
}