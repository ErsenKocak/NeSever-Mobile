import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearchResponse.dart';
import 'package:ne_sever_mobile/repository/product_search_repository.dart';

part 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  final _productSearchRepository = locator<ProductSearchRepository>();

  ProductSearchCubit() : super(ProductSearchInitial());

  Future<void> postSearchProduct(ProductSearch productSearch) async {
    try {
      emit(ProductSearchLoadingState());
      await Future.delayed(Duration(seconds: 5));
      final response =
          await _productSearchRepository.postSearchProduct(productSearch);

      emit(ProductSearchLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(ProductSearchErrorState(e.errorMessage));
    }
  }
}
