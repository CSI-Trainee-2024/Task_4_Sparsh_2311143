// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/pages/add_todo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// List<Todo> todos = [Todo(title: "vjnv",description: "vrjvv"),Todo(title: "dbvvb", description: "vudfdbvhvbf")];
  // List<int> a = [1,4,6,7];
  // List<String> b = ["cdhbcb","cdhbdcd","ihbhv"];


  // _test(){
  //   for(int i=0;i<todos.length;i++){
  //     print(todos[i].title);
  //     print(todos[i].description);
  //   }
  // }
  



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToMenuPage();
    super.initState();
  }

  _goToMenuPage() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AddTodo()),
          (Route<dynamic> route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [darkBlueColor, lightBlueColor, whiteColor],
            ),
          ),
          child: Image.asset("assets/splash_image.png"),
        ),
      ),
    );
  }
}
