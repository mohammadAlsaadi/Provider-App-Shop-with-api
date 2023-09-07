import 'package:statemanagement/api_manager/product_api.dart';
import 'package:statemanagement/data/home_page/home_page_models/products.dart';

class HomePageRepository {
  Future<List<Product>> fitchProductFromAPI() async {
    List<Product> productList = await ProductApiManager.fetchProducts();

    return productList;
  }
}
