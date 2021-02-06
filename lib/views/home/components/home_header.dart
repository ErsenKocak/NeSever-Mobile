import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SearchField(
            hintText: 'Hediye Ara',
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            // press: () => Navigator.pushNamed(context, CartScreen.routeName),
            numOfitem: 1, press: () {},
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
