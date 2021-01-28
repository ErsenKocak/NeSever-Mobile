import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/ProductDetail.dart';
import 'package:ne_sever_mobile/service/product_detail_service.dart';

class ProductDetailRepository {
  final _productDetailService = locator<ProductDetailService>();
  Future<ProductDetail> getProductDetail(int productId) async {
    return await _productDetailService.getProductDetail(productId);
  }
}
