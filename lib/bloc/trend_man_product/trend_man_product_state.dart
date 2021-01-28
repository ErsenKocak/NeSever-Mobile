part of 'trend_man_product_cubit.dart';

@immutable
abstract class TrendManProductState {}

class TrendManProductInitial extends TrendManProductState {}

class TrendManProductLoadingState extends TrendManProductState {}

class TrendManProductLoadedState extends TrendManProductState {
  final List<Product> trendManProductList;

  TrendManProductLoadedState(this.trendManProductList);
}

class TrendManProductErrorState extends TrendManProductState {
  final String errorMessage;

  TrendManProductErrorState(this.errorMessage);
}
