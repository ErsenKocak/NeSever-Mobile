import 'package:dio/dio.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';

import 'package:ne_sever_mobile/models/ProductDetail.dart';

class ProductDetailService {
  Future<ProductDetail> getProductDetail(int productId) async {
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response =
          await _dio.get(baseUrl + 'Urun/UrunDetayIcerikGetir?id=$productId');

      if (_response.statusCode == 200) {
        return ProductDetail.fromJson(_response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      return null;
    }
  }
}
