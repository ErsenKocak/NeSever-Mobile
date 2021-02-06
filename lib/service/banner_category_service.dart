import 'package:dio/dio.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/BannerCategory.dart';

class BannerCategoryService {
  Future<List<BannerCategory>> getCategoryBanners() async {
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;

    try {
      final _response =
          await _dio.get(baseUrl + 'Sayfa/KategoriBannerIcerikListGetir');

      if (_response.statusCode == 200) {
        return (_response.data as List)
            .map((x) => BannerCategory.fromJson(x))
            .toList();
      } else {
        throw MyNetworkError('Bağlantı Sağlanamadı !',
            responseStatusCode: _response.statusCode.toString());
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        throw MyNetworkError('İstek Zaman Aşımına Uğradı !');
      } else {
        throw MyNetworkError('Bağlantı Sağlanamadı !',
            responseStatusCode: e.response.statusCode.toString());
      }
    }
  }
}
