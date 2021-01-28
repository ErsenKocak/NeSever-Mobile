import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/components/default_button.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_description.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_images.dart';
import 'package:ne_sever_mobile/views/product-detail/components/top_rounded_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailView extends StatefulWidget {
  final Product trendWomanProduct;

  const ProductDetailView({Key key, @required this.trendWomanProduct})
      : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    print(widget.trendWomanProduct.urunId);

    return Scaffold(
      appBar: AppBarWidget(
          title: AppBarTitleTextWidget(
        title: widget.trendWomanProduct.urunAdi,
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductImages(trendWomanProduct: widget.trendWomanProduct),
              TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    ProductDescription(
                      trendWomanProduct: widget.trendWomanProduct,
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
                                  press: () => launchURL(
                                      widget.trendWomanProduct.adresUrl),
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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
