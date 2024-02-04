import 'package:flutter/foundation.dart';
import 'package:shopx/data/network/network_api_services.dart';

import '../../model/product_model/product_model.dart';
import '../../res/app_urls/app_urls.dart';

class ProductsRepository {
  final _apiService = NetworkApiServices();

  Future<List<ProductModel>> getProductsAPI() async {
    dynamic response = await _apiService.getApi(AppUrls.productAPI);
    if (response is List) {
      List<ProductModel> products =
          response.map((e) => ProductModel.fromJson(e)).toList();
      if (kDebugMode) {
        print("Product list length: ${products.length}");
      }

      return products;
    } else {
      throw const FormatException("Unexpected Response Format");
    }

    //   return ProductModel.fromJson(response);
  }
}
