import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Brand.dart';

class BrandService {
  Future<List<Brand>> getBrands() async {
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response = await _dio.get(baseUrl + 'Urun/MarkaIcerikListGetir');
      if (_response.statusCode == 200) {
        return (_response.data as List).map((x) => Brand.fromJson(x)).toList();
      } else {
        return null;
      }
    } on DioError catch (e) {
      // if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      //   throw MyNetworkError('İstek Zaman Aşımına Uğradı !');
      // } else {
      //   throw MyNetworkError('Bağlantı Sağlanamadı !',
      //       responseStatusCode: e.response.statusCode.toString());
      // }
      return null;
    }
  }
}
