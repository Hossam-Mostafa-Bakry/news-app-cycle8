import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/pages/home_page/home_view.dart';
import 'package:news_app_cycle8_sat/pages/splash_page/splash_view.dart';
import 'package:news_app_cycle8_sat/shared_component/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView(),
      },
    );
  }
}
