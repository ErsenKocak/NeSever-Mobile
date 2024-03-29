import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/BannerModel.dart';

class BannerService {
  Future<List<BannerModel>> getBanners() async {
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response = await _dio.get(baseUrl + 'Sayfa/BannerIcerikListGetir');

      if (_response.statusCode == 200) {
        return (_response.data as List)
            .map((x) => BannerModel.fromJson(x))
            .toList();
      } else {
        // print('Status Code Non 200');
        // MyNetworkError('Bağlantı Sağlanamadı !',
        //     responseStatusCode: _response.statusCode.toString());
        return null;
      }
    } on DioError catch (e) {
      // print('Banner Service CATCH ERROR');
      // if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      //   MyNetworkError('İstek Zaman Aşımına Uğradı !');
      // } else {
      //   MyNetworkError('Bağlantı Sağlanamadı !',
      //       responseStatusCode: e.response.statusCode.toString());
      // }
      return null;
    }
  }
}
