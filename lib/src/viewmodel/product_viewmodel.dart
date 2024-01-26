import 'package:flutter/material.dart';
import 'package:venta_flutter/src/data/service/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _productService;

  ProductViewModel(this._productService);

  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> get products => _products;

  Map<String, dynamic> _productDetails = {};
  Map<String, dynamic> get productDetails => _productDetails;

  bool _loading = false;
  bool get loading => _loading;

  String _error = '';
  String get error => _error;

  Future<void> fetchAllProducts(int collectionId) async {
    try {
      _loading = true;
      notifyListeners();

      _products = await _productService.getAllProducts(collectionId);

      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchProductDetails(int productId) async {
    try {
      _loading = true;
      notifyListeners();

      _productDetails = await _productService.getProductDetails(productId);

      _loading = false;
      notifyListeners();
    } catch (e) {
      _loading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}
