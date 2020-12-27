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
                        Expanded(flex: 2, child: buildCategoryListView(state)),
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
          child:
              //buildCategoryList(state),

              ListView.builder(
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
          child: Column(
            children: [Expanded(child: buildExpansionTileList(state))],
          ),
        ),
      ],
    );
  }

  buildExpansionTileList(CategoryLoadedState state) {
    final expansionTileList = List<Widget>();
    state.categoryList
        .map((e) => {
              if (e.ustKategoriId != null &&
                  selectedCategory != null &&
                  e.ustKategoriId == selectedCategory.kategoriId)
                {
                  expansionTileList.add(ExpansionTileCard(
                    initialElevation: 4,
                    shadowColor: kSecondaryColor,
                    baseColor: kLightPrimaryColor,
                    expandedColor: kLightPrimaryColor,
                    onExpansionChanged: (value) {
                      print(e.kategoriAdi);
                      setState(() {
                        selectedSubCategory = e;
                      });
                    },
                    title: Text(
                      e.kategoriAdi,
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
                  ))
                }
              else
                {SizedBox()}
            })
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: expansionTileList,
      ),
    );
  }

  buildCategoryList(CategoryLoadedState state) {
    final categoryWidgetList = List<Widget>();

    state.categoryList
        .map(
          (category) => {
            if (category.ustKategoriId == null)
              {
                categoryWidgetList.add(
                  CategoryCard(
                    key: Key('counter-${category.kategoriId}'),
                    category: category,
                    icon: 'assets/icons/book.svg',
                    text: category.kategoriAdi,
                    press: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      print(selectedCategory.kategoriAdi);
                    },
                  ),
                )
              },
          },
        )
        .toList();

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: categoryWidgetList,
        ),
      ),
    );
  }
}
