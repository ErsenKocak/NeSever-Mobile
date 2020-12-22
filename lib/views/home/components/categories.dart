import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ne_sever_mobile/bloc/category/cubit/category_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/Category.dart';

// class Categories extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           categories.length,
//           (index) => CategoryCard(
//             category: categories[index],
//             icon: categories[index].iconUrl,
//             text: categories[index].categoryText,
//           ),
//         ),
//       ),
//     );
//   }
// }

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
      onTap: () => {
        setState(() {
          // widget.category.isActive = !widget.category.isActive;
        })
      },
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(50),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
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
