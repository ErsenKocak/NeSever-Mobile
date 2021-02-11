import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/core/widgets/custom_buttom_navigation_bar.dart';
import 'package:ne_sever_mobile/views/category/view/category_view.dart';
import 'package:ne_sever_mobile/views/home/view/home_view.dart';
import 'package:ne_sever_mobile/views/profile/view/profile_view.dart';
import 'package:ne_sever_mobile/views/router_view/viewmodel/router_view_model.dart';

class RouterView extends StatefulWidget {
  //final List<Widget> _viewList = [HomeView(), CategoryView()];
  @override
  _RouterViewState createState() => _RouterViewState();
}

class _RouterViewState extends State<RouterView> {
  final _routerViewModel = locator<RouterViewModel>();

  int _currentIndex = 0;
  PageController _pageController;
  final homePageStorageKey = PageStorageKey("homeViewKey");
  final categoryPageStorageKey = PageStorageKey("categoryViewKey");
  final profilePageStorageKey = PageStorageKey("profileViewKey");
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),

      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: _currentIndex,
      //   onItemSelected: (index) async {
      //     setState(() => _currentIndex = index);
      //     await _pageController.animateToPage(index,
      //         duration: Duration(seconds: 1), curve: Curves.easeIn);
      //   },
      //   items: <BottomNavyBarItem>[
      //     BottomNavyBarItem(title: Text('Ana Sayfa'), icon: Icon(Icons.home)),
      //     BottomNavyBarItem(title: Text('Kategoriler'), icon: Icon(Icons.apps)),
      //     BottomNavyBarItem(
      //         title: Text('Profilim'),
      //         icon: Icon(Icons.supervised_user_circle_sharp)),
      //   ],
      // ),
      body: Observer(builder: (_) {
        return _routerViewModel.pageList[_routerViewModel.currentViewIndex];
        // return Text(_routerViewModel.currentViewIndex.toString());
      }),
      // body: SizedBox.expand(
      //   child: PageView(
      //     controller: _pageController,
      //     onPageChanged: (index) {
      //       setState(() => _currentIndex = index);
      //     },
      //     children: <Widget>[
      //       HomeView(
      //         key: homePageStorageKey,
      //       ),
      //       CategoryView(
      //         key: categoryPageStorageKey,
      //       ),
      //       ProfileView(
      //         key: profilePageStorageKey,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
