part of 'categorybanner_cubit.dart';

@immutable
abstract class CategoryBannerState {}

class CategoryBannerInitial extends CategoryBannerState {}

class CategoryBannerLoadingState extends CategoryBannerState {}

class CategoryBannerLoadedState extends CategoryBannerState {
  final List<BannerCategory> bannerCategoryList;

  CategoryBannerLoadedState(this.bannerCategoryList);
}

class CategoryBannerErrorState extends CategoryBannerState {
  final String errorMessage;

  CategoryBannerErrorState(this.errorMessage);
}
