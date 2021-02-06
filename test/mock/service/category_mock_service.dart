import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';

import '../model/category_mock_model.dart';

class CategoryMockService {
  Future<List<CategoryMockModel>> getCategories(
      {bool isHomePage = true}) async {
    final _logger = locator<Logger>();
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;
    try {
      final _response = await _dio.get(baseUrl +
          'Urun/KategoriIcerikListGetir?AnasayfadaGoster=$isHomePage');
      switch (_response.statusCode) {
        case HttpStatus.ok:
          _logger.w(_response.data.length);
          return (_response.data as List)
              .map((x) => CategoryMockModel.fromJson(x))
              .toList();

          break;
        default:
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
