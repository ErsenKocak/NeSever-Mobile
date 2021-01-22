part of 'banner_cubit.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoadingState extends BannerState {
  BannerLoadingState();
}

class BannerLoadedState extends BannerState {
  final List<Banner> categoryList;

  BannerLoadedState(this.categoryList);
}

class BannerErrorState extends BannerState {
  final String errorMessage;

  BannerErrorState(this.errorMessage);
}
