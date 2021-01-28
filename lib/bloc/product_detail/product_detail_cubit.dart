import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/ProductDetail.dart';
import 'package:ne_sever_mobile/repository/product_detail_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final _productDetailRepository = locator<ProductDetailRepository>();
  ProductDetailCubit() : super(ProductDetailInitial());

  void getProductDetail(int productId) async {
    try {
      emit(ProductDetailLoadingState());
      final response =
          await _productDetailRepository.getProductDetail(productId);

      emit(ProductDetailLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(ProductDetailErrorState(e.errorMessage));
    }
  }
}
