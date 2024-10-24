// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(30),
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [darkBlueColor, blueColor, lightBlueColor, whiteColor],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/splash_image.png"),
                Column(
                  children: [
                    Text("Welcome to Go Task",
                        style: TextStyle(
                            fontSize: screenWidth * 0.08, color: whiteColor)),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      "A workplace to over 10 Million influencers around the global of the world.",
                      style: TextStyle(
                          fontSize: screenWidth * 0.04, color: whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("Let's Start",
                        style: TextStyle(fontSize: 20, color: whiteColor)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
