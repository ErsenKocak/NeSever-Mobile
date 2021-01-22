import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Banner.dart';
import 'package:ne_sever_mobile/service/banner_service.dart';

class BannerRepository {
  final _bannerService = locator<BannerService>();

  Future<List<Banner>> getBanners() async {
    return await _bannerService.getBanners();
  }
}
