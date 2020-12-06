import 'package:flutter/material.dart';
import 'package:ne_sever_mobile/core/app/theme.dart';
import 'package:ne_sever_mobile/views/forgot_password/view/forgot_password_view.dart';
import 'package:ne_sever_mobile/views/home/view/home_view.dart';
import 'package:ne_sever_mobile/views/sign_in/view/sign_in_view.dart';
import 'package:ne_sever_mobile/views/splash/view/splash_view.dart';

import 'views/sign_up/view/sign_up_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ne Sever ?',
      theme: theme(),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signUp': (context) => SignUpView(),
        '/signIn': (context) => SignInView(),
        '/home': (context) => HomeView(),
        '/forgot-password': (context) => ForgotPasswordView(),
        // '/cart': (context) => SignInScreen(),
      },
      initialRoute: '/splash',
    );
  }
}
