import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/image_manager.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/models/BannerCategory.dart';
import 'package:ne_sever_mobile/views/home/components/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryBannerWidget extends StatelessWidget {
  final List<BannerCategory> bannerCategoryList;

  const CategoryBannerWidget({Key key, @required this.bannerCategoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(bannerCategoryList[0].adi);
    return Column(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bannerCategoryList.length,
          itemBuilder: (context, index) => Container(
            child: CategoryBannerCard(
              imgUrl: bannerCategoryList[index].resim,
              onPress: () {
                print(
                    'Category Banner Tıklandı ${bannerCategoryList[index].adi}');
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
