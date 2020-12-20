import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/components/default_button.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/views/product-detail/components/color_dots.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_description.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_images.dart';
import 'package:ne_sever_mobile/views/product-detail/components/top_rounded_container.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({Key key, @HttpStatus.UPGRADE_REQUIRED this.product})
      : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: AppBarTitleTextWidget(
        title: widget.product.title,
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductImages(product: widget.product),
              TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    ProductDescription(
                      product: widget.product,
                      pressOnSeeMore: () {},
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Column(
                      children: [
                        // ColorDots(product: widget.product),
                        TopRoundedContainer(
                          color: Color(0xFFF6F7F9),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.15,
                              right: SizeConfig.screenWidth * 0.15,
                              bottom: getProportionateScreenWidth(40),
                              top: getProportionateScreenWidth(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultButton(
                                  color: kPurpleColor,
                                  text: "Fiyat Gör",
                                  press: () {},
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                DefaultButton(
                                  color: kPinkColor,
                                  text: "Hediye Sepetine Ekle",
                                  press: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
