import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/models/ProductDetail.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.productDetail,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ProductDetail productDetail;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              productDetail.urunAdi,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/gift.png',
                      height: getProportionateScreenHeight(35),
                    ),
                    AppBarTitleTextWidget(
                        title: productDetail.hediyeSepetiSayisi.toString()),
                  ],
                ),
                SizedBox(width: getProportionateScreenWidth(35)),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/lookcount.png',
                      height: getProportionateScreenHeight(35),
                    ),
                    AppBarTitleTextWidget(
                        title: productDetail.goruntulenmeSayisi.toString()),
                  ],
                ),
              ],
            ),
            // Container(  //Favori Butonu
            //   padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            //   width: getProportionateScreenWidth(50),
            //   decoration: BoxDecoration(
            //     color:
            //         product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
            //     borderRadius: BorderRadius.circular(100.0),
            //   ),
            //   child: SvgPicture.asset(
            //     "assets/icons/Heart Icon_2.svg",
            //     color:
            //         product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
            //     height: getProportionateScreenWidth(15),
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        // Padding(   // Ürün açıklaması
        //   padding: EdgeInsets.only(
        //     left: getProportionateScreenWidth(20),
        //     right: getProportionateScreenWidth(64),
        //   ),
        //   child: Text(
        //     trendWomanProduct.urunAdi,
        //     maxLines: 3,
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: getProportionateScreenWidth(20),
        //     vertical: 10,
        //   ),
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Row(
        //       children: [
        //         Text(
        //           "Detayını gör",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600, color: kPrimaryColor),
        //         ),
        //         SizedBox(width: 5),
        //         Icon(
        //           Icons.arrow_forward_ios,
        //           size: 12,
        //           color: kPrimaryColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
