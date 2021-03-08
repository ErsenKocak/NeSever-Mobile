import 'package:dio/dio.dart';
import 'package:ne_sever_mobile/bloc/trend_woman_product/trend_woman_product_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';

class TrendWomanProductService {
  Future<List<Product>> getTrendWomanProducts() async {
    //final _logger = locator<Logger>();
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response =
          await _dio.get(baseUrl + 'Urun/TrendKadinUrunIcerikListGetir');

      if (_response.statusCode == 200) {
        //_logger.w(_response.data);
        return (_response.data as List)
            .map((x) => Product.fromJson(x))
            .toList();
      } else {
        // throw MyNetworkError('Bağlantı Sağlanamadı !');

        return null;
      }
    } on DioError catch (e) {
      // if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      //   MyNetworkError('İstek Zaman Aşımına Uğradı !');
      // } else {
      //   MyNetworkError('Bağlantı Sağlanamadı1 !');
      //   //throw TrendWomanProductErrorState('Bağlantı Sağlanamadı');

      // }
      return null;
    }
  }
}
