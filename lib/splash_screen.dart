




import 'dart:async';

import 'package:ecommerce/enums.dart';
import 'package:ecommerce/register_page.dart';
import 'package:ecommerce/shared.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  Timer(const Duration(seconds: 5), (){
  Shared.getBOOL(key: SharedKeys.isLastOnBoarding) ?
      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()))
  :

  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingScreen()));
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/pic2.png')
        ],
      ),
    );
  }
}
