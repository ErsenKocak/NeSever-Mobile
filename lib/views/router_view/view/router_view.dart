import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/core/widgets/custom_buttom_navigation_bar.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

class RouterView extends StatelessWidget {
  //final List<Widget> _viewList = [HomeView(), CategoryView()];
  final _routerViewModel = locator<RouterViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Observer(builder: (_) {
        return _routerViewModel.pageList[_routerViewModel.currentViewIndex];
        // return Text(_routerViewModel.currentViewIndex.toString());
      }),
    );
  }
}
