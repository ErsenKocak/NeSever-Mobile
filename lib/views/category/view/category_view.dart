import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/loading_bar_manager.dart';

import '../../../bloc/category/category_cubit.dart';
import '../../../core/app/constants.dart';
import '../../../models/Category.dart';
import '../../home/components/categories.dart';
import '../../home/components/search_field.dart';

// class CategoryView extends StatefulWidget {
//   CategoryView({Key key}) : super(key: key);

//   @override
//   _CategoryViewState createState() => _CategoryViewState();
// }

// class _CategoryViewState extends State<CategoryView> {
//   bool isActive = false;
//   CategoryModel selectedCategory;
//   CategoryModel selectedSubCategory;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Container(
//             //   child: SearchField(
//             //     hintText: 'Kategori Ara',
//             //   ),
//             // ),
//             //Divider(),
//             BlocConsumer<CategoryCubit, CategoryState>(
//               listener: (context, state) {
//                 if (state is CategoryErrorState) {
//                   Scaffold.of(context).showSnackBar(
//                       SnackBar(content: Text(state.errorMessage)));
//                 }
//               },
//               // ignore: missing_return
//               builder: (context, state) {
//                 if (state is CategoryInitialState) {
//                   EasyLoading.show();
//                   // ignore: deprecated_member_use
//                   context.bloc<CategoryCubit>().getCategories();
//                   return Center(
//                     child: Text(''),
//                   );
//                 } else if (state is CategoryLoadingState) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is CategoryLoadedState) {
//                   EasyLoading.dismiss();
//                   return Expanded(flex: 2, child: buildCategoryListView(state));
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     ));
//   }

//   Widget buildCategoryListView(CategoryLoadedState state) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: ListView.builder(
//             itemCount: state.categoryList.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (state.categoryList[index].ustKategoriId == null) {
//                 return CategoryCard(
//                   key: Key('counter-$index'),
//                   category: state.categoryList[index],
//                   icon: 'assets/icons/book.svg',
//                   text: state.categoryList[index].kategoriAdi,
//                   press: () {
//                     setState(() {
//                       selectedCategory = state.categoryList[index];
//                     });
//                     print(selectedCategory.kategoriAdi);
//                   },
//                 );
//               } else {
//                 return SizedBox();
//               }
//             },
//           ),
//         ),
//         Expanded(
//             flex: 8,
//             child: selectedCategory != null
//                 ? buildExpansionTileList(state)
//                 : Text('asdasd')),
//       ],
//     );
//   }

//   buildExpansionTileList(CategoryLoadedState state) {
//     final expansionTileList = List<Widget>();
//     state.categoryList
//         .map((e) => {
//               if (e.ustKategoriId != null &&
//                   selectedCategory != null &&
//                   e.ustKategoriId == selectedCategory.kategoriId)
//                 {
//                   expansionTileList.add(ExpansionTileCard(
//                     initialElevation: 4,
//                     shadowColor: kSecondaryColor,
//                     baseColor: kLightPrimaryColor,
//                     expandedColor: kLightPrimaryColor,
//                     onExpansionChanged: (value) {
//                       setState(() {
//                         selectedSubCategory = e;
//                       });
//                     },
//                     title: Text(
//                       e.kategoriAdi,
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     children: <Widget>[
//                       Divider(
//                         thickness: 1.0,
//                         height: 1.0,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8.0,
//                             vertical: 8.0,
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   itemCount: state.categoryList.length,
//                                   itemBuilder: (context, index) {
//                                     if (selectedSubCategory != null &&
//                                         state.categoryList[index]
//                                                 .ustKategoriId ==
//                                             selectedSubCategory.kategoriId) {
//                                       return Text(state
//                                           .categoryList[index].kategoriAdi);
//                                     } else {
//                                       return Text('asdasd');
//                                     }
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       ButtonBar(
//                         alignment: MainAxisAlignment.spaceAround,
//                         buttonHeight: 52.0,
//                         buttonMinWidth: 90.0,
//                         children: <Widget>[],
//                       ),
//                     ],
//                   ))
//                 }
//               else
//                 {SizedBox()}
//             })
//         .toList();

//     if (expansionTileList.length > 0) {
//       return SingleChildScrollView(
//         child: Column(
//           children: expansionTileList,
//         ),
//       );
//     } else {
//       return SizedBox();
//     }
//   }

//   buildExpansionTileSubCategoryList(List<CategoryModel> categoryList) {
//     print("buildExpansionTileSubCategoryList Çalıştı");

//     var expansionTileSubCategoryList = List<Widget>();
//     for (CategoryModel category in categoryList) {
//       if (selectedSubCategory != null &&
//           category.ustKategoriId == selectedSubCategory.kategoriId) {
//         print(category.kategoriAdi);
//         expansionTileSubCategoryList.add(Text(category.kategoriAdi));
//       } else {
//         //print('ife girmedi');
//         //Text('asdasd')
//       }
//     }

//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: expansionTileSubCategoryList,
//         ),
//       ),
//     );
//   }
// }

class CategoryView extends StatelessWidget {
  CategoryView({
    Key key,
  }) : super(key: key);

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
          return SizedBox(
            child: ListView.builder(
              key: PageStorageKey('subCategoryList'),
              shrinkWrap: true,
              itemCount: subCategoryList.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  key: PageStorageKey("expansionTileCard${index}"),
                  title: Text(subCategoryList[index].kategoriAdi),
                );
              },
            ),
          );
        }

        return Text('asdasd');
      },
    );
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

  // buildCategoryListView(CategoryLoadedState state) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     mainAxisSize: MainAxisSize.max,
  //     children: [
  //       Container(
  //         color: Colors.yellow,
  //         child: Text('ASd'),
  //       )
  //       // Expanded(
  //       //   flex: 2,
  //       //   child: ListView.builder(
  //       //     itemCount: state.categoryList.length,
  //       //     itemBuilder: (BuildContext context, int index) {
  //       //       if (state.categoryList[index].ustKategoriId == null) {
  //       //         return CategoryCard(
  //       //           key: Key('counter-$index'),
  //       //           category: state.categoryList[index],
  //       //           icon: 'assets/icons/book.svg',
  //       //           text: state.categoryList[index].kategoriAdi,
  //       //           press: () {

  //       //           },
  //       //         );
  //       //       } else {
  //       //         return SizedBox();
  //       //       }
  //       //     },
  //       //   ),
  //       // ),
  //       // Expanded(
  //       //     flex: 8,
  //       //     child: selectedCategory != null
  //       //         ? buildExpansionTileList(state)
  //       //         : Text('asdasd')),
  //     ],
  //   );
  // }
}
