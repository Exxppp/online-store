import 'package:online_store/api/base_api.dart';
import 'package:online_store/api/models/product.dart';

class ProductApi extends BaseApi {

  Future<List<ProductModel>> getProducts({int offset = 0, int? categoryId}) async {
    const relativePath = 'api/common/product/list';
    final Map<String, String> params = {
      'offset': offset.toString(),
    };
    if (categoryId != null) {
      params.addAll({'categoryId': categoryId.toString()});
    }
    print(params);

    final jsonData = await get(relativePath, params: params);
    final List<ProductModel> categories = (jsonData['data'] as List)
        .map((productJson) => ProductModel.fromJson(productJson))
        .toList();
    return categories;
  }
}
