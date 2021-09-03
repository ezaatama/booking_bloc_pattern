import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/ui/pages/mainpage.dart';
import '/ui/pages/get_started.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/splash_page.dart';
void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (ctx) => SplashPage(),
        '/get-started' : (ctx) => GetStartedPage(),
        '/sign-up' : (ctx) => SignUp(),
        '/mainpage' : (ctx) => MainPage()
      },
    );
  }
}