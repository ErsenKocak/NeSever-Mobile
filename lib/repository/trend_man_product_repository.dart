import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/service/trend_man_product_service.dart';

class TrendManProductRepository {
  final _trendManProductService = locator<TrendManProductService>();

  Future<List<Product>> getTrendManProducts() async {
    return await _trendManProductService.getTrendManProducts();
  }
}
