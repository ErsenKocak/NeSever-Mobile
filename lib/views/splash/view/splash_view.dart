import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ne_sever_mobile/bloc/banner/cubit/banner_cubit.dart';
import 'package:ne_sever_mobile/bloc/banner_category/categorybanner_cubit.dart';
import 'package:ne_sever_mobile/bloc/brand/brand_cubit.dart';
import 'package:ne_sever_mobile/bloc/category/category_cubit.dart';
import 'package:ne_sever_mobile/bloc/splash_view/splashviewcubit_cubit.dart';
import 'package:ne_sever_mobile/bloc/trend_man_product/trend_man_product_cubit.dart';
import 'package:ne_sever_mobile/bloc/trend_woman_product/trend_woman_product_cubit.dart';
import 'package:ne_sever_mobile/core/app/constants.dart';
import 'package:ne_sever_mobile/core/app/size_config.dart';
import 'package:ne_sever_mobile/core/components/default_button.dart';
import 'package:ne_sever_mobile/core/shared/shared_preferences_manager.dart';
import 'package:ne_sever_mobile/views/splash/components/splash_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  buildHomeViewBlocs(BuildContext context) {
    context.bloc<CategoryCubit>().getCategories();
    context.bloc<BannerCubit>().getBanners();
    context.bloc<CategorybannerCubit>().getCategoryBanners();
    context.bloc<TrendWomanProductCubit>().getTrendWomanProducts();
    context.bloc<TrendManProductCubit>().getTrendManProducts();
    context.bloc<BrandCubit>().getBrands();
  }

  @override
  void initState() {
    super.initState();

    //buildHomeViewBlocs(context);
  }

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
                    context.read<SplashViewCubit>().getCurrentPageIndex(value);
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
                  child: BlocBuilder<SplashViewCubit, int>(
                    builder: (context, state) {
                      return Column(
                        children: <Widget>[
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => buildDot(
                                  index: index, currentPageIndex: state),
                            ),
                          ),
                          Spacer(flex: 3),
                          state == (splashData.length - 1)
                              ? DefaultButton(
                                  text: "Devam et",
                                  press: () {
                                    Navigator.pushNamed(context, '/router');
                                  },
                                )
                              : SizedBox(),
                          Spacer(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildDot({int index, int currentPageIndex}) {
    return Column(
      children: [
        AnimatedContainer(
          duration: kAnimationDuration,
          margin: EdgeInsets.only(right: 5),
          height: 6,
          width: currentPageIndex == index ? 20 : 6,
          decoration: BoxDecoration(
            color:
                currentPageIndex == index ? kPrimaryColor : Color(0xFFD8D8D8),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}
