import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/models/Category.dart';
import 'package:ne_sever_mobile/views/home/components/categories.dart';
import 'package:ne_sever_mobile/views/home/components/search_field.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool isActive = false;
  final category = Category();
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
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryCard(
                          category: categories[index],
                          icon: categories[index].iconUrl,
                          text: categories[index].categoryText,
                          press: (isActive) {
                            print(categories[index].categoryText);
                          },
                        );
                      },
                    ),
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
