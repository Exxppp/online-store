import 'package:online_store/api/base_api.dart';
import 'package:online_store/api/models/category.dart';

class CategoryApi extends BaseApi {

  Future<List<CategoryModel>> getCategories() async {
    const relativePath = 'api/common/category/list';
    final jsonData = await get(relativePath);
    final List<CategoryModel> categories =
        (jsonData['data']["categories"] as List)
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
            .toList();
    return categories;
  }
}
