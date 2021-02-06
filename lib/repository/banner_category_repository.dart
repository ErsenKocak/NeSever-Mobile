import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/BannerCategory.dart';
import 'package:ne_sever_mobile/service/banner_category_service.dart';

class BannerCategoryRepository {
  final _bannerCategoryService = locator<BannerCategoryService>();

  Future<List<BannerCategory>> getBanners() async {
    return await _bannerCategoryService.getCategoryBanners();
  }
}
