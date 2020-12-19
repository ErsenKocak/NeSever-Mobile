import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';

class GiftCartView extends StatefulWidget {
  @override
  _GiftCartViewState createState() => _GiftCartViewState();
}

class _GiftCartViewState extends State<GiftCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarWidget(title: AppBarTitleTextWidget(title: 'Hediye Sepeti')),
      body: Center(
        child: Text('Gift Cart View'),
      ),
    );
  }
}
