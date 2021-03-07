import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/core/app/gift_search_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/loading_bar_manager.dart';
import 'package:ne_sever_mobile/core/components/product_widget.dart';
import 'package:ne_sever_mobile/models/product_search/ProductSearch.dart';

import '../../../bloc/category/category_cubit.dart';
import '../../../core/app/constants.dart';
import '../../../models/Category.dart';
import '../../home/components/categories.dart';
import '../../home/components/search_field.dart';

class CategoryView extends StatefulWidget {
  CategoryView({
    Key key,
  }) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int _activeMeterIndex;
  int expandedSubCategoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: SearchField(
                hintText: 'Kategori Ara',
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Divider(
              color: Colors.grey.shade200,
              height: 0.5,
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: buildCategoryListView(),
                    ),
                    Expanded(
                      flex: 8,
                      child: buildSubCategoryList(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  buildCategoryListView() {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryErrorState) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      // ignore: missing_return
      builder: (context, state) {
        if (state is CategoryInitialState) {
          // ignore: deprecated_member_use
          context.bloc<CategoryCubit>().getCategories();
          return Center(
            child: Text(''),
          );
        } else if (state is CategoryLoadingState) {
          showLoadingBar();
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoadedState) {
          dismissLoadingBar();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                if (state.categoryList[index].ustKategoriId == null) {
                  return CategoryCard(
                    key: Key('counter-$index'),
                    category: state.categoryList[index],
                    icon: 'assets/icons/book.svg',
                    text: state.categoryList[index].kategoriAdi,
                    press: () {
                      print('tıklandı');
                      context.bloc<SubCategoryCubit>().getSubCategories(
                          state.categoryList[index], state.categoryList);
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          );
        }
      },
    );
  }

  buildSubCategoryList() {
    return BlocConsumer<SubCategoryCubit, List<CategoryModel>>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.length > 0) {
          final subCategoryList = (state as List<CategoryModel>);
          print("state.length > 0");
          print(state);

          return SingleChildScrollView(
              child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    expandedSubCategoryId =
                        subCategoryList[panelIndex].kategoriId;
                  });
                  ProductSearch productSearch =
                      buildGiftSearch(subCategoryList[panelIndex].parametre);
                  context
                      .bloc<ProductSearchCubit>()
                      .postSearchProduct(productSearch);
                },
                children: subCategoryList.map((subCategory) {
                  return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Text(subCategory.kategoriAdi);
                      },
                      isExpanded:
                          subCategory.kategoriId == expandedSubCategoryId
                              ? true
                              : false,
                      body: buildProductSearch(context, ProductSearchCubit()));
                }).toList(),
              )
            ],
          )

              //  Column(
              //   children: subCategoryList.map<ExpansionTileCard>((subCategory) {
              //     return ExpansionTileCard(
              //       onExpansionChanged: (value) {
              //         if (value) {
              //           ProductSearch productSearch =
              //               buildGiftSearch(subCategory.parametre);
              //           context
              //               .bloc<ProductSearchCubit>()
              //               .postSearchProduct(productSearch);
              //         } else {
              //           return false;
              //         }
              //       },
              //       title: Text(subCategory.kategoriAdi),
              //       children: [buildProductSearch(context, ProductSearchCubit())],
              //     );
              //   }).toList(),
              // ),
              );

          // return SizedBox(
          //   child: ListView.builder(
          //     key: PageStorageKey('subCategoryList'),
          //     shrinkWrap: true,
          //     itemCount: subCategoryList.length,
          //     itemBuilder: (context, index) {
          //       // return ExpansionTile(
          //       //   key: PageStorageKey("expansionTileCard${index}"),
          //       //   title: Text(subCategoryList[index].kategoriAdi),
          //       //   backgroundColor: kLightPrimaryColor,
          //       //   initiallyExpanded: false,
          //       //   onExpansionChanged: (value) {
          //       //     print('VALUE' + value.toString());
          //       //     if (value) {
          //       //       ProductSearch productSearch =
          //       //           buildGiftSearch(subCategoryList[index].parametre);
          //       //       context
          //       //           .bloc<ProductSearchCubit>()
          //       //           .postSearchProduct(productSearch);
          //       //     } else {
          //       //       return false;
          //       //     }
          //       //   },
          //       //   children: [buildProductSearch(context, ProductSearchCubit())],
          //       // );

          //     },
          //   ),
          // );
        }

        return Text('');
      },
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
          return Center(
            child: Text('Initial'),
          );
        } else if (state is ProductSearchLoadingState) {
          //showLoadingBar();
          return Center(
            child: Text(''),
          );
        } else if (state is ProductSearchLoadedState) {
          //dismissLoadingBar();
          if (state.productSearchResponse.items.length > 0) {
            return Container(
              child: ProductWidget(
                productList: state.productSearchResponse.items,
                // sectionTitle: widget.searchingWord != null
                //     ? "\"${widget.searchingWord}\"" +
                //         "\t" +
                //         "İle Bulunan Sonuçlar" +
                //         " " +
                //         "(${state.productSearchResponse.items.length})"
                //     : ''
                sectionTitle: null,
              ),
            );
          } else {
            return Center(
              child: Text(''),
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
