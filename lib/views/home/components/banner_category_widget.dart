import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/core/app/gift_search_manager.dart';
import 'package:ne_sever_mobile/core/app/image_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/BannerCategory.dart';
import 'package:ne_sever_mobile/views/product_search/product_search_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBannerWidget extends StatelessWidget {
  final List<BannerCategory> bannerCategoryList;

  const CategoryBannerWidget({Key key, @required this.bannerCategoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          key: PageStorageKey('11'),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bannerCategoryList.length,
          itemBuilder: (context, index) => Container(
            child: CategoryBannerCard(
              imgUrl:
                  "https://www.nesever.com.tr${bannerCategoryList[index].resim}",
              onPress: () {
                print(bannerCategoryList[index].parametre);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductSearchView(),
                    ));
                final productSearch =
                    buildGiftSearch(bannerCategoryList[index].parametre);
                context
                    .bloc<ProductSearchCubit>()
                    .postSearchProduct(productSearch);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryBannerCard extends StatelessWidget {
  final String imgUrl;
  final VoidCallback onPress;

  const CategoryBannerCard({Key key, @required this.imgUrl, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              buildImages(context, imgUrl),
              Text.rich(
                TextSpan(
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      //text: "$category\n",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TextSpan(text: "$numOfBrands Brands")
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
