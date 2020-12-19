import 'package:flutter/material.dart';

import '../../../core/app/constants.dart';
import '../../../core/components/appbar_title_text.dart';
import '../../../core/widgets/drawer_widget.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent.withOpacity(0),
      //   elevation: 0,
      //   title: Text('Profil'),
      // ),
      drawer: DrawerWidget(),
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       //wrap with expanded
      //       Container(
      //         height: 200,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //               image: NetworkImage(
      //                   "https://www.kocaali.com/images/album/Image_7.jpg"),
      //               fit: BoxFit.cover),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 60,
      //       ),
      //       Text('asdasdsdsd')
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarTitleTextWidget(title: 'Profil'),
            centerTitle: false,
            iconTheme: IconThemeData(color: kPrimaryColor),
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: Image.network(
                "https://picsum.photos/404",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
          // SliverGrid.count(
          //   crossAxisCount: 5,
          //   children: <Widget>[
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //     Text("a"),
          //   ],
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate((index, context) {
              return Container(
                color: Colors.red,
                height: 100,
                child: Card(child: Text("a")),
              );
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
