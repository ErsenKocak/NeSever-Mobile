import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ne_sever_mobile/core/init/Keys/view_keys.dart';
import 'package:ne_sever_mobile/views/category/view/category_view.dart';
import 'package:ne_sever_mobile/views/home/view/home_view.dart';
import 'package:ne_sever_mobile/views/profile/view/profile_view.dart';
part 'router_view_model.g.dart';

class RouterViewModel = _RouterViewModelBase with _$RouterViewModel;

abstract class _RouterViewModelBase with Store {
  @observable
  List<Widget> pageList = [
    HomeView(key: homeViewKey),
    CategoryView(
      key: categoryViewKey,
    ),
    ProfileView(
      key: profileViewKey,
    ),
  ];

  @observable
  int currentViewIndex = 0;

  @action
  void changePageIndex(BuildContext context, int index) {
    currentViewIndex = index;
  }
}
