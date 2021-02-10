import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Brand.dart';
import 'package:ne_sever_mobile/repository/brand_repository.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  final _brandRepository = locator<BrandRepository>();

  BrandCubit() : super(BrandInitial());

  void getBrands() async {
    try {
      emit(BrandLoadingState());
      final response = await _brandRepository.getBanners();
      emit(BrandLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(BrandErrorState(e.errorMessage));
    }
  }
}
