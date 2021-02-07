import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ne_sever_mobile/bloc/brand/brand_cubit.dart';
import 'package:ne_sever_mobile/bloc/product_detail/product_detail_cubit.dart';
import 'package:ne_sever_mobile/bloc/product_search/product_search_cubit.dart';
import 'package:ne_sever_mobile/views/product_search/product_search_view.dart';
import 'bloc/banner/cubit/banner_cubit.dart';
import 'bloc/banner_category/categorybanner_cubit.dart';
import 'bloc/trend_woman_product/trend_woman_product_cubit.dart';
import 'core/app/theme.dart';
import 'core/init/locator/locator.dart';
import 'views/category/view/category_view.dart';
import 'views/forgot_password/view/forgot_password_view.dart';
import 'views/friends/friends_view.dart';
import 'views/gift_cart/view/gift_card_view.dart';
import 'views/home/view/home_view.dart';
import 'views/photos/photos_view.dart';
import 'views/router_view/view/router_view.dart';
import 'views/settings/settings_view.dart';
import 'views/sign_in/view/sign_in_view.dart';
import 'views/splash/view/splash_view.dart';
import 'bloc/category/category_cubit.dart';
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
          BlocProvider<BrandCubit>(create: (context) => BrandCubit()),
          BlocProvider<ProductSearchCubit>(
              create: (context) => ProductSearchCubit()),
          BlocProvider<ProductDetailCubit>(
              create: (context) => ProductDetailCubit()),
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
            '/search-product': (context) => ProductSearchView(
                  searchingWord: null,
                ),
          },
          initialRoute: '/splash',
        ));
  }
}
