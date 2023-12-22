import 'package:online_store/core/model/base_api.dart';
import 'package:online_store/category/model/entities/category.dart';

class CategoryApi extends BaseApi {

  Future<List<Category>> getCategories() async {
    const relativePath = 'api/common/category/list';
    final jsonData = await get(relativePath);
    final List<Category> categories =
        (jsonData['data']["categories"] as List)
            .map((categoryJson) => Category.fromJson(categoryJson))
            .toList();
    return categories;
  }
}
