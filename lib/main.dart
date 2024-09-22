import 'package:ecommerce/shared.dart';
import 'package:ecommerce/splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage()
    );
  }
}

