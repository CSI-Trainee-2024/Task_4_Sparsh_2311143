// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [
    Todo(
        title: "Sparsh",
        description: "Test Todo Description",
        date: '2024-10-24',
        time: '1:30'),
    Todo(
        title: "Gupta",
        description: "Todo tdjfejkgfewkgewkg vnrergkerkgerkghergh nkgnergerg jnewkg fnewgerkg ",
        date: '2024-10-24',
        time: '2:30'),
    Todo(
        title: "App",
        description: "Todo task",
        date: '2024-10-24',
        time: '2:30')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              color: lightBlueColor,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/splash_image.png"),
                  ),
                  Container(
                    width: screenWidth*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todos[index].title!,
                        ),
                        Text(todos[index].description!)
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    ));
  }
}
