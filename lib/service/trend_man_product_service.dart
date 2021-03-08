import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';

class TrendManProductService {
  Future<List<Product>> getTrendManProducts() async {
    final _logger = locator<Logger>();
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response =
          await _dio.get(baseUrl + 'Urun/TrendErkekUrunIcerikListGetir');

      if (_response.statusCode == 200) {
        //_logger.w(_response.data);
        return (_response.data as List)
            .map((x) => Product.fromJson(x))
            .toList();
      } else {
      return null;
      }
    } on DioError catch (e) {
     return null;
    }
  }
}
