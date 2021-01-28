import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Brand.dart';
import 'package:ne_sever_mobile/service/brand_service.dart';

class BrandRepository {
  final _brandService = locator<BrandService>();

  Future<List<Brand>> getBanners() async {
    return await _brandService.getBrands();
  }
}
