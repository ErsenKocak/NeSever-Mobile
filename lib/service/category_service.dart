import 'package:dio/dio.dart';

import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Category.dart';

class CategoryService {
  Future<List<CategoryModel>> getCategories({bool isHomePage = true}) async {
    //final _logger = locator<Logger>();
    final _options = locator<BaseOptions>();
    final _dio = Dio();
    _dio.options = _options;
    try {
      final _response = await _dio.get(baseUrl +
          'Urun/KategoriIcerikListGetir?AnasayfadaGoster=$isHomePage');

      if (_response.statusCode == 200) {
        //_logger.w(_response.data);
        return (_response.data as List)
            .map((x) => CategoryModel.fromJson(x))
            .toList();
      } else {
        return null;
      }
    } on DioError catch (e) {
      return null;
    }
  }
}
