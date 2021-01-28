import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/repository/banner_category_repository.dart';
import 'package:ne_sever_mobile/repository/banner_repository.dart';
import 'package:ne_sever_mobile/repository/category_repository.dart';
import 'package:ne_sever_mobile/service/banner_category_service.dart';
import 'package:ne_sever_mobile/service/banner_service.dart';
import 'package:ne_sever_mobile/service/category_service.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => RouterViewModel());
  locator.registerLazySingleton(() => CategoryRepository());
  locator.registerLazySingleton(() => CategoryService());
  locator.registerLazySingleton(() => BannerRepository());
  locator.registerLazySingleton(() => BannerService());
  locator.registerLazySingleton(() => BannerCategoryRepository());
  locator.registerLazySingleton(() => BannerCategoryService());
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => Logger());
  locator.registerLazySingleton(() => BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000));
}
// locator.registerLazySingleton(() => Logger());
