import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';

class FriendsView extends StatefulWidget {
  @override
  _FriendsViewState createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppBarTitleTextWidget(title: 'Arkadaşlar')),
      body: Center(
        child: Text('Friends View'),
      ),
    );
  }
}
