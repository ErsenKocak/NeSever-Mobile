import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app/constants.dart';
import '../../../core/app/size_config.dart';
import '../../../models/Category.dart';

// ignore: must_be_immutable
class CategoryCard extends StatefulWidget {
  CategoryModel category;
  final String icon, text;
  final Function press;

  CategoryCard({Key key, this.icon, this.text, this.press, this.category})
      : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: kLightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                widget.icon,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 5),
            Text(widget.text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
