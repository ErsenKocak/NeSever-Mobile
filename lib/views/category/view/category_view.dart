import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/widgets/custom_buttom_navigation_bar.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CategoryView'),
      ),
    );
  }
}
