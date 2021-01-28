part of 'brand_cubit.dart';

@immutable
abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandLoadingState extends BrandState {}

class BrandLoadedState extends BrandState {
  final List<Brand> brandList;

  BrandLoadedState(this.brandList);
}

class BrandErrorState extends BrandState {
  final String errorMessage;

  BrandErrorState(this.errorMessage);
}
