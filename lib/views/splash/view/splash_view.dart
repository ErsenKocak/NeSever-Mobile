import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/default_button.dart';
import 'package:ne_sever_mobile/views/splash/components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Hediyenin yeni adı Ne Sever!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "İstenmeyen süprizlere Ne Sever'de yer yok",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Hediye almanın kolay yolunu buluyoruz.Bizimle evde kalın",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 3),
                      currentPage == (splashData.length - 1)
                          ? DefaultButton(
                              text: "Devam et",
                              press: () {
                                Navigator.pushNamed(context, '/router');
                              },
                            )
                          : SizedBox(),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
