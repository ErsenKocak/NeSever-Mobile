import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Banner.dart';
import 'package:ne_sever_mobile/repository/banner_repository.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final _bannerRepository = locator<BannerRepository>();
  BannerCubit() : super(BannerInitial());

  void getBanners() async {
    try {
      emit(BannerLoadingState());
      final response = await _bannerRepository.getBanners();
      emit(BannerLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(BannerErrorState(e.errorMessage));
    }
  }
}
