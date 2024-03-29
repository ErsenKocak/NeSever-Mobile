import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/service/trend_woman_product_service.dart';

class TrendWomanProductRepository {
  final _trendWomanProductService = locator<TrendWomanProductService>();

  Future<List<Product>> getTrendWomanProducts() async {
    return await _trendWomanProductService.getTrendWomanProducts();
  }
}
