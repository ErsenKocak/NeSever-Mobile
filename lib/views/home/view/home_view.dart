import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/widgets/custom_buttom_navigation_bar.dart';
import 'package:ne_sever_mobile/views/home/components/categories.dart';
import 'package:ne_sever_mobile/views/home/components/discount_banner.dart';
import 'package:ne_sever_mobile/views/home/components/home_header.dart';
import 'package:ne_sever_mobile/views/home/components/popular_product.dart';
import 'package:ne_sever_mobile/views/home/components/special_offers.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              //Categories(),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenWidth(10)),
              PopularProducts(),
              SizedBox(height: getProportionateScreenWidth(30)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
