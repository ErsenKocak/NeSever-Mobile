import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/repository/banner_category_repository.dart';
import 'package:ne_sever_mobile/repository/banner_repository.dart';
import 'package:ne_sever_mobile/repository/brand_repository.dart';
import 'package:ne_sever_mobile/repository/category_repository.dart';
import 'package:ne_sever_mobile/repository/product_detail_repository.dart';
import 'package:ne_sever_mobile/repository/product_search_repository.dart';
import 'package:ne_sever_mobile/repository/trend_man_product_repository.dart';
import 'package:ne_sever_mobile/repository/trend_woman_product_repository.dart';
import 'package:ne_sever_mobile/service/banner_category_service.dart';
import 'package:ne_sever_mobile/service/banner_service.dart';
import 'package:ne_sever_mobile/service/brand_service.dart';
import 'package:ne_sever_mobile/service/category_service.dart';
import 'package:ne_sever_mobile/service/product_detail_service.dart';
import 'package:ne_sever_mobile/service/product_search_service.dart';
import 'package:ne_sever_mobile/service/trend_man_product_service.dart';
import 'package:ne_sever_mobile/service/trend_woman_product_service.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => CategoryRepository());
  locator.registerLazySingleton(() => CategoryService());
  locator.registerLazySingleton(() => BannerRepository());
  locator.registerLazySingleton(() => BannerService());
  locator.registerLazySingleton(() => BannerCategoryRepository());
  locator.registerLazySingleton(() => BrandService());
  locator.registerLazySingleton(() => BrandRepository());
  locator.registerLazySingleton(() => ProductDetailService());
  locator.registerLazySingleton(() => ProductDetailRepository());
  locator.registerLazySingleton(() => BannerCategoryService());
  locator.registerLazySingleton(() => TrendWomanProductRepository());
  locator.registerLazySingleton(() => TrendWomanProductService());
  locator.registerLazySingleton(() => TrendManProductRepository());
  locator.registerLazySingleton(() => TrendManProductService());
  locator.registerLazySingleton(() => ProductSearchRepository());
  locator.registerLazySingleton(() => ProductSearchService());
  locator.registerLazySingleton(() => RouterViewModel());
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => Logger());
  locator.registerLazySingleton(() => BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000));
}
// locator.registerLazySingleton(() => Logger());
