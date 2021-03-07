import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ne_sever_mobile/bloc/product_detail/product_detail_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/appbar_title_text.dart';
import 'package:ne_sever_mobile/core/components/default_button.dart';
import 'package:ne_sever_mobile/core/components/loading_bar_manager.dart';
import 'package:ne_sever_mobile/core/widgets/appbar_widget.dart';
import 'package:ne_sever_mobile/models/Product.dart';
import 'package:ne_sever_mobile/models/ProductDetail.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_description.dart';
import 'package:ne_sever_mobile/views/product-detail/components/product_images.dart';
import 'package:ne_sever_mobile/views/product-detail/components/top_rounded_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Future<void> initState() {
    showLoadingBar();
    context.bloc<ProductDetailCubit>().getProductDetail(widget.product.urunId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppBarTitleTextWidget(
          title: widget.product.urunAdi,
        ),
      ),
      body: BlocConsumer<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {
          if (state is ProductDetailErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        // ignore: missing_return
        builder: (context, state) {
          if (state is ProductDetailInitial) {
            // ignore: deprecated_member_use
            context
                .bloc<ProductDetailCubit>()
                .getProductDetail(widget.product.urunId);
            return Center(
              child: SizedBox(),
            );
          } else if (state is ProductDetailLoadingState) {
            return Center(
              child: Text(''),
            );
          } else if (state is ProductDetailLoadedState) {
            dismissLoadingBar();
            return buildProductDetail(state.productDetail);
          } else if (state is ProductDetailErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));

            return Text('');
          }
        },
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

  buildProductDetail(ProductDetail _productDetail) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductImages(
              productDetail: _productDetail,
              product: widget.product,
            ),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    productDetail: _productDetail,
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
                                press: () => launchURL(_productDetail.link),
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
    );
  }
}
