import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/BannerCategory.dart';
import 'package:ne_sever_mobile/repository/banner_category_repository.dart';

part 'categorybanner_state.dart';

class CategorybannerCubit extends Cubit<CategoryBannerState> {
  final _bannerCategoryRepository = locator<BannerCategoryRepository>();
  CategorybannerCubit() : super(CategoryBannerInitial());

  void getCategoryBanners() async {
    try {
      emit(CategoryBannerLoadingState());
      final response = await _bannerCategoryRepository.getBanners();
      emit(CategoryBannerLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(CategoryBannerErrorState(e.errorMessage));
    }
  }
}
