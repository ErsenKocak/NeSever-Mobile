import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final _routerViewModel = locator<RouterViewModel>();
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) => _routerViewModel.changePageIndex(context, index),
      index: _routerViewModel.currentViewIndex,
      animationDuration: Duration(milliseconds: 300),
      key: _bottomNavigationKey,
      height: 50,
      backgroundColor: kPrimaryColor,
      items: <Widget>[
        Icon(Icons.home_outlined, size: 20),
        Icon(
          Icons.category_outlined,
          size: 20,
        ),
        Icon(
          Icons.person_outline,
          size: 20,
        ),
      ],
    );
  }
}
