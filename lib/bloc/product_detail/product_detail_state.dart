part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductDetail productDetail;

  ProductDetailLoadedState(this.productDetail);
}

class ProductDetailErrorState extends ProductDetailState {
  final String errorMessage;

  ProductDetailErrorState(this.errorMessage);
}
