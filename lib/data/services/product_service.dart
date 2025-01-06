import 'package:dio/dio.dart';
import 'package:online_shop/data/model/product_model.dart';
import 'package:online_shop/utils/http_clinet.dart';

class ProductService {
  Future<ProductModel> getLatestProduct() async {
    Response response = await httpClient.get('products?order=latest');
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel> getPopularProduct() async {
    Response response = await httpClient.get('products?order=popular');
    return ProductModel.fromJson(response.data);
  }
}
