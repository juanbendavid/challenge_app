import 'package:challenge_app/models/models.dart';
import 'package:challenge_app/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
   List<Product> _products = [];
  final int _limit = 20;
  int? _total;

  List<Product> get products => _products;

 Future<void> fetchProducts({bool loadMore = false}) async {
  // simulate a delay
  if(_total != null && _products.length == _total) return;
    try {
      final data = await _apiService.getProducts(
        skip: _products.length, limit: _limit);
      _total = data.total;
      if (loadMore) {
        _products.addAll(data.products);
      } else {
        _products = data.products;
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }


  refreshProducts() async {
    _products = [];
    notifyListeners();
  }

  

}
