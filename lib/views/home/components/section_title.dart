import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
            onTap: press,
            child: Column(
              children: [
                Text(
                  showMore ? "Daha Fazlası..." : "",
                  style: TextStyle(color: Color(0xFFBBBBBB)),
                ),
              ],
            )),
      ],
    );
  }
}
