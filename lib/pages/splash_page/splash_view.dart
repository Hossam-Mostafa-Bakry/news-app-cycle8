import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_cycle8_sat/pages/home_page/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/background_pattern.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset("assets/images/splash_icon.png")),
      ),
    );
  }
}
