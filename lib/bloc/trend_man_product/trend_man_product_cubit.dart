import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/repository/trend_man_product_repository.dart';
part 'trend_man_product_state.dart';

class TrendManProductCubit extends Cubit<TrendManProductState> {
  final _trendManProductRepository = locator<TrendManProductRepository>();

  TrendManProductCubit() : super(TrendManProductInitial());

  void getTrendManProducts() async {
    try {
      emit(TrendManProductLoadingState());
      final response = await _trendManProductRepository.getTrendManProducts();

      emit(TrendManProductLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(TrendManProductErrorState(e.errorMessage));
    }
  }
}
