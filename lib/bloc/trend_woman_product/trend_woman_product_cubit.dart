import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ne_sever_mobile/core/app/network_error.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/repository/trend_woman_product_repository.dart';

part 'trend_woman_product_state.dart';

class TrendWomanProductCubit extends Cubit<TrendWomanProductState> {
  final _trendWomanProductRepository = locator<TrendWomanProductRepository>();
  TrendWomanProductCubit() : super(TrendWomanProductInitial());

  void getTrendWomanProducts() async {
    try {
      emit(TrendWomanProductLoadingState());
      final response =
          await _trendWomanProductRepository.getTrendWomanProducts();

      emit(TrendWomanProductLoadedState(response));
    } on MyNetworkError catch (e) {
      emit(TrendWomanProductErrorState(e.errorMessage));
    }
  }
}
