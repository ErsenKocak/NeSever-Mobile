import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/BannerModel.dart';
import '../app/image_manager.dart';

class ImageSliderWidget extends StatelessWidget {
  final List<BannerModel> bannerCategoryList;

  const ImageSliderWidget({Key key, @required this.bannerCategoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildBannerImages(context);
  }

  buildBannerImages(BuildContext context) {
    final List<Widget> imageSliders = bannerCategoryList
        .map((item) => InkWell(
              onTap: () => launchURL(item.link),
              child: Container(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          buildImages(context, item.resimBase64),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ))
        .toList();

    return Container(
        width: 1200,
        height: 400,
        child: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                key: PageStorageKey('9'),
                options: CarouselOptions(
                  height: 400,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
          ],
        ));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
