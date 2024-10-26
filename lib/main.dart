import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
      scaffoldBackgroundColor: backgroundColor
    ),
      home: const SplashScreen(),
    );
  }
}


