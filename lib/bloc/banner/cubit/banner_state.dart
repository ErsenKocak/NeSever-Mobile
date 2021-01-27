part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoadingState extends BannerState {
  BannerLoadingState();
}

class BannerLoadedState extends BannerState {
  final List<BannerModel> bannerCategoryList;

  BannerLoadedState(this.bannerCategoryList);
}

class BannerErrorState extends BannerState {
  final String errorMessage;

  BannerErrorState(this.errorMessage);
}
