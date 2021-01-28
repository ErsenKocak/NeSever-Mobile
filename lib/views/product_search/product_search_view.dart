import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';

class ProductSearchView extends StatefulWidget {
  final String searchingWord;
  String lastSearchingWord;
  ProductSearchView({Key key, @required this.searchingWord}) : super(key: key);

  @override
  _ProductSearchViewState createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text('Product Search'),
      ),
      body: buildProductSearch(context),
    );
  }

  buildProductSearch(BuildContext context) {
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
          ProductSearch productSearch = ProductSearch();
          productSearch.aramaKelime = widget.searchingWord;
          context.bloc<ProductSearchCubit>().postSearchProduct(productSearch);
          return Center(
            child: SizedBox(),
          );
        } else if (state is ProductSearchLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSearchLoadedState) {
          Logger().w(state.productSearchResponse);
          if (widget.lastSearchingWord != widget.searchingWord) {
            ProductSearch productSearch = ProductSearch();
            productSearch.aramaKelime = widget.searchingWord;
            context.bloc<ProductSearchCubit>().postSearchProduct(productSearch);
          }
          return Center(
            child: Text(state.productSearchResponse.items[0].urunAdi),
          );
        } else if (state is ProductSearchErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return Text('');
        }
      },
    );
  }
}
