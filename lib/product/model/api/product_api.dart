import 'package:online_store/core/model/base_api.dart';
import 'package:online_store/product/model/entities/product.dart';

class ProductApi extends BaseApi {

  Future<List<Product>> getProducts({int offset = 0, int? categoryId}) async {
    const relativePath = 'api/common/product/list';
    final Map<String, String> params = {
      'offset': offset.toString(),
    };
    if (categoryId != null) {
      params.addAll({'categoryId': categoryId.toString()});
    }

    final jsonData = await get(relativePath, params: params);
    final List<Product> products = (jsonData['data'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return products;
  }

  Future<Product> getProductDetails({required int productId}) async {
    const relativePath = 'api/common/product/details';
    final Map<String, String> params = {
      'productId': productId.toString(),
    };

    final jsonData = await get(relativePath, params: params);
    final Product product = Product.fromJson(jsonData['data']);
    return product;
  }
}
