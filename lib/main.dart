import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/banner/cubit/banner_cubit.dart';
import 'package:ne_sever_mobile/bloc/banner_category/categorybanner_cubit.dart';
import 'package:ne_sever_mobile/bloc/category/cubit/category_cubit.dart';
import 'package:ne_sever_mobile/bloc/trend_woman_product/trend_woman_product_cubit.dart';
import 'package:ne_sever_mobile/core/app/theme.dart';
import 'package:ne_sever_mobile/core/init/locator/locator.dart';
import 'package:ne_sever_mobile/views/category/view/category_view.dart';
import 'package:ne_sever_mobile/views/forgot_password/view/forgot_password_view.dart';
import 'package:ne_sever_mobile/views/friends/friends_view.dart';
import 'package:ne_sever_mobile/views/gift_cart/view/gift_card_view.dart';
import 'package:ne_sever_mobile/views/home/view/home_view.dart';
import 'package:ne_sever_mobile/views/photos/photos_view.dart';
import 'package:ne_sever_mobile/views/router_view/view/router_view.dart';
import 'package:ne_sever_mobile/views/settings/settings_view.dart';
import 'package:ne_sever_mobile/views/sign_in/view/sign_in_view.dart';
import 'package:ne_sever_mobile/views/splash/view/splash_view.dart';

import 'bloc/trend_man_product/trend_man_product_cubit.dart';
import 'views/sign_up/view/sign_up_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
          BlocProvider<BannerCubit>(create: (context) => BannerCubit()),
          BlocProvider<CategorybannerCubit>(
              create: (context) => CategorybannerCubit()),
          BlocProvider<TrendWomanProductCubit>(
              create: (context) => TrendWomanProductCubit()),
          BlocProvider<TrendManProductCubit>(
              create: (context) => TrendManProductCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ne Sever ?',
          theme: theme(),
          routes: {
            '/splash': (context) => SplashScreen(),
            '/signUp': (context) => SignUpView(),
            '/signIn': (context) => SignInView(),
            '/home': (context) => HomeView(),
            '/forgot-password': (context) => ForgotPasswordView(),
            '/category': (contet) => CategoryView(),
            '/router': (context) => RouterView(),
            '/settings': (context) => SettingsView(),
            '/gift-cart': (context) => GiftCartView(),
            '/photos': (context) => PhotosView(),
            '/friends': (context) => FriendsView(),
          },
          initialRoute: '/splash',
        ));
  }
}
