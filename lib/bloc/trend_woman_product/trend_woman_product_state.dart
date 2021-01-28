part of 'trend_woman_product_cubit.dart';

@immutable
abstract class TrendWomanProductState {}

class TrendWomanProductInitial extends TrendWomanProductState {}

class TrendWomanProductLoadingState extends TrendWomanProductState {}

class TrendWomanProductLoadedState extends TrendWomanProductState {
  final List<Product> trendWomanProductList;

  TrendWomanProductLoadedState(this.trendWomanProductList);
}

class TrendWomanProductErrorState extends TrendWomanProductState {
  final String errorMessage;

  TrendWomanProductErrorState(this.errorMessage);
}
