import 'package:dio/dio.dart';
import 'package:statemanagement/data/home_page/home_page_models/products.dart';

class ProductApiManager {
  static Future<List<Product>> fetchProducts() async {
    final dio = Dio();

    try {
      final response =
          await dio.get('https://fakestoreapi.com/products?limit=20');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Product> products =
            data.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
