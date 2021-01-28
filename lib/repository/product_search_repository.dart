import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearchResponse.dart';
import 'package:ne_sever_mobile/service/product_search_service.dart';

class ProductSearchRepository {
  final _productSearchService = locator<ProductSearchService>();
  Future<ProductSearchResponse> postSearchProduct(
      ProductSearch productSearch) async {
    return await _productSearchService.postSearchProduct(productSearch);
  }
}
