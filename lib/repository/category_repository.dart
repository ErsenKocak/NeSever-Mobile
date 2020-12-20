import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Category.dart';
import 'package:ne_sever_mobile/service/category_service.dart';

class CategoryRepository {
  final _categoryService = locator<CategoryService>();

  Future<List<CategoryModel>> getCategories() async {
    return await _categoryService.getCategories();
  }
}
