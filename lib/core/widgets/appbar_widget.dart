import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  Widget title;
  Color backgroundColor;
  List<Widget> actions;
  Widget leading;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  AppBarWidget(
      {@required this.title,
      this.backgroundColor,
      this.actions,
      this.leading}) {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    );
  }
}
