import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/models/BannerModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageSliderWidget extends StatelessWidget {
  final List<BannerModel> bannerCategoryList;

  const ImageSliderWidget({Key key, @required this.bannerCategoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildBannerCategoryImages(context);
  }

  imageFromBase64String(BuildContext context, String base64Image) {
    final size = MediaQuery.of(context).size;
    final splittedBase64String = base64Image.split(",")[1];

    return Image.memory(
      base64Decode(splittedBase64String),
      fit: BoxFit.fill,
      height: size.height,
    );
  }

  buildBannerCategoryImages(BuildContext context) {
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
                          imageFromBase64String(context, item.resimBase64),
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
        child: Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlayInterval: Duration(seconds: 3),
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
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
