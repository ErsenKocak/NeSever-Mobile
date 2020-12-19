import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';

class PhotosView extends StatefulWidget {
  @override
  _PhotosViewState createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppBarTitleTextWidget(title: 'Fotoğraflar')),
      body: Center(
        child: Text('Photos View'),
      ),
    );
  }
}
