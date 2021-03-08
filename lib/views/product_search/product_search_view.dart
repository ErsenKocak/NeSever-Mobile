import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/loading_bar_manager.dart';
import 'package:ne_sever_mobile/core/components/product_widget.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';

class ProductSearchView extends StatefulWidget {
  final String searchingWord;
  final ProductSearch productSearch;
  ProductSearchView({Key key, this.searchingWord, this.productSearch})
      : super(key: key);

  @override
  _ProductSearchViewState createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView> {
  List<Product> productSearchList;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final productSearchCubit = context.bloc<ProductSearchCubit>();

    return Scaffold(
      appBar: AppBarWidget(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: buildProductSearch(context, productSearchCubit),
      ),
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

          widget.productSearch.aramaKelime = widget.searchingWord;
          productSearchCubit.postSearchProduct(widget.productSearch);
          return Center(
            child: SizedBox(),
          );
        } else if (state is ProductSearchLoadingState) {
          EasyLoading.show();
          return Center(
            child: Text(''),
          );
        } else if (state is ProductSearchLoadedState) {
          EasyLoading.dismiss();
          if (state.productSearchResponse.items.length > 0) {
            productSearchList = List<Product>();
            productSearchList.addAll(state.productSearchResponse.items);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProductWidget(
                      productList: productSearchList,
                      sectionTitle: widget.searchingWord != null
                          ? "\"${widget.searchingWord}\"" +
                              "\t" +
                              "İle Bulunan Sonuçlar" +
                              " " +
                              "(${state.productSearchResponse.metaData.totalItemCount})"
                          : ''),
                ],
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "\"${widget.searchingWord}\" için ürün bulunamadı!",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
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
