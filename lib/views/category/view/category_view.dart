import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/category/cubit/category_cubit.dart';
import 'package:ne_sever_mobile/views/home/components/categories.dart';

import '../../../models/Category.dart';
import '../../home/components/search_field.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool isActive = false;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<CategoryCubit, CategoryState>(
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
                        return Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: state.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (state.categoryList[index].ustKategoriId ==
                                  null) {
                                return CategoryCard(
                                  category: state.categoryList[index],
                                  icon: 'assets/icons/book.svg',
                                  text: state.categoryList[index].kategoriAdi,
                                  press: (isActive) {
                                    // print(categories[index].categoryText);
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
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
