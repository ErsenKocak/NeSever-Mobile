import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
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
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          print('CERTİFİCATED');

          return true;
        };
        return client;
      };
      final _response =
          await _dio.get(baseUrl + 'Sayfa/KategoriBannerIcerikListGetir');

      if (_response.statusCode == 200) {
        return (_response.data as List)
            .map((x) => BannerCategory.fromJson(x))
            .toList();
      } else {
        return null;
      }
    } on DioError catch (e) {
      // Logger().e('Banner Category Service Catch Error');
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
