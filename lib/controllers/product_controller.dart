import 'dart:convert';

import 'package:e_market_api/models/products.dart';
import 'package:http/http.dart' as http;

class ProductController {
  Future<List<dynamic>> getProducts(String category) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/category/$category'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final products = jsonData['products']
          .map((product) => Product.fromJson(product))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Product.fromJson(jsonData);
    }
    throw Exception('Failed to load product');
  }
}

