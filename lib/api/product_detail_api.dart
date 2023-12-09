import 'package:online_store/api/base_api.dart';
import 'package:online_store/api/models/product.dart';

class ProductDetailApi extends BaseApi {

  Future<ProductModel> getProduct({required int productId}) async {
    const relativePath = 'api/common/product/details';
    final Map<String, String> params = {
      'productId': productId.toString(),
    };

    final jsonData = await get(relativePath, params: params);
    final ProductModel product = ProductModel.fromJson(jsonData['data']);
    return product;
  }
}
