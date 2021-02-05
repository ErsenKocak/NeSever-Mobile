import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';

class ProductSearchView extends StatefulWidget {
  final String searchingWord;

  ProductSearchView({Key key, @required this.searchingWord}) : super(key: key);

  @override
  _ProductSearchViewState createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView> {
  @override
  Widget build(BuildContext context) {
    final productSearchCubit = context.bloc<ProductSearchCubit>();

    return Scaffold(
      appBar: AppBarWidget(
        title: Text('Product Search'),
      ),
      body: buildProductSearch(context, productSearchCubit),
    );
  }

  buildProductSearch(
      BuildContext context, ProductSearchCubit productSearchCubit) {
    return BlocConsumer<ProductSearchCubit, ProductSearchState>(
      listener: (context, state) {
        if (state is ProductSearchErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is ProductSearchInitial) {
          print('STATE INITIAL');
          ProductSearch productSearch = ProductSearch();
          productSearch.aramaKelime = widget.searchingWord;
          productSearchCubit.postSearchProduct(productSearch);
          return Center(
            child: SizedBox(),
          );
        } else if (state is ProductSearchLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSearchLoadedState) {
          if (state.productSearchResponse != null) {
            return Center(
              child: Text(state.productSearchResponse.items[0].urunAdi),
            );
          } else {
            return Center(
              child: Text('DATA BOŞ'),
            );
          }
        } else if (state is ProductSearchErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }
}
