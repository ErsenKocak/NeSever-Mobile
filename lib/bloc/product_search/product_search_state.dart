part of 'product_search_cubit.dart';

@immutable
abstract class ProductSearchState {}

class ProductSearchInitial extends ProductSearchState {}

class ProductSearchLoadingState extends ProductSearchState {}

class ProductSearchLoadedState extends ProductSearchState {
  final ProductSearchResponse productSearchResponse;

  ProductSearchLoadedState(this.productSearchResponse);
}

class ProductSearchErrorState extends ProductSearchState {
  final String errorMessage;

  ProductSearchErrorState(this.errorMessage);
}
