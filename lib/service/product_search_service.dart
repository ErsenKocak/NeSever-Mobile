import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearchResponse.dart';

class ProductSearchService {
  Future<ProductSearchResponse> postSearchProduct(
      ProductSearch productSearch) async {
    final _logger = locator<Logger>();
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;
    print('SERVİCE ÇALIŞTI');
    try {
      var searchProductObj = {"AramaKelime": productSearch.aramaKelime};

      final _response = await _dio.post(baseUrl + 'Urun/UrunIcerikListGetir',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: searchProductObj);

      if (_response.statusCode == 200) {
        return ProductSearchResponse.fromJson(_response.data);
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
