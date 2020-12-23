import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/category/cubit/category_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/views/home/components/categories.dart';

import '../../../models/Category.dart';
import '../../home/components/search_field.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  bool isActive = false;
  CategoryModel selectedCategory;
  CategoryModel selectedSubCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: SearchField(
                hintText: 'Kategori Ara',
              ),
            ),
            Divider(),
            Expanded(
              child: BlocConsumer<CategoryCubit, CategoryState>(
                listener: (context, state) {
                  if (state is CategoryErrorState) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is CategoryInitialState) {
                    context.bloc<CategoryCubit>().getCategories();
                    return Center(
                      child: Text(''),
                    );
                  } else if (state is CategoryLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategoryLoadedState) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: buildCategoryListView(state),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildCategoryListView(CategoryLoadedState state) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: state.categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              if (state.categoryList[index].ustKategoriId == null) {
                return CategoryCard(
                  key: Key('counter-${index}'),
                  category: state.categoryList[index],
                  icon: 'assets/icons/book.svg',
                  text: state.categoryList[index].kategoriAdi,
                  press: () {
                    setState(() {
                      selectedCategory = state.categoryList[index];
                    });
                    print(selectedCategory.kategoriAdi);
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),

        Expanded(
          flex: 8,
          //TODO: IS Working
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.categoryList.length,
                  itemBuilder: (context, index) {
                    if (state.categoryList[index].ustKategoriId != null &&
                        selectedCategory != null &&
                        state.categoryList[index].ustKategoriId ==
                            selectedCategory.kategoriId) {
                      return ExpansionTileCard(
                        initialElevation: 4,
                        shadowColor: kSecondaryColor,
                        baseColor: kLightPrimaryColor,
                        expandedColor: kLightPrimaryColor,
                        onExpansionChanged: (value) {
                          print(state.categoryList[index].kategoriAdi);
                          setState(() {
                            selectedSubCategory = state.categoryList[index];
                          });
                        },
                        title: Text(
                          state.categoryList[index].kategoriAdi,
                          style: TextStyle(fontSize: 14),
                        ),
                        children: <Widget>[
                          Divider(
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 8.0,
                              ),
                              child: ListView.builder(
                                itemCount: state.categoryList.length,
                                itemBuilder: (context, index) {
                                  if (selectedSubCategory != null &&
                                      state.categoryList[index].ustKategoriId ==
                                          selectedSubCategory.kategoriId) {
                                    return Text(
                                        state.categoryList[index].kategoriAdi);
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.spaceAround,
                            buttonHeight: 52.0,
                            buttonMinWidth: 90.0,
                            children: <Widget>[],
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),

        // Expanded(
        //   //TODO: IS Working
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: ListView.builder(
        //           itemCount: state.categoryList.length,
        //           itemBuilder: (context, index) {
        //             if (selectedCategory != null &&
        //                 state.categoryList[index].ustKategoriId ==
        //                     selectedCategory.kategoriId) {
        //               return Text(state.categoryList[index].kategoriAdi);
        //             } else {
        //               return SizedBox();
        //             }
        //           },
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
