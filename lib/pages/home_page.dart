// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/add_todo.dart';
import 'package:todo_app/pages/update_todo.dart';
import 'package:todo_app/shared/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  double _getCompletedTodosValue() {
    int numberOfCompletedTodos = 0;
    for (int i = 0; i < todos.length; i++) {
      if (todos[i].isCompleted) {
        numberOfCompletedTodos++;
      }
    }
    if (todos.isEmpty) {
      return 0.0;
    }
    return (numberOfCompletedTodos / todos.length);
  }

  _getImageLink(String category) {
    if (category == "Design") {
      return "assets/design.png";
    } else if (category == "Development") {
      return "assets/development.png";
    } else {
      return "assets/research.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Home Page",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, vertical: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const [darkBlueColor, blueColor, lightBlueColor],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Today's Progress Summary",
                          style: TextStyle(fontSize: 20, color: whiteColor)),
                      SizedBox(height: 10),
                      Text("${todos.length.toString()} Tasks",
                          style: TextStyle(fontSize: 14, color: whiteColor)),
                      SizedBox(height: 15),
                      LinearProgressIndicator(
                        value: _getCompletedTodosValue(),
                        backgroundColor: greyColor,
                        color: whiteColor,
                        minHeight: 10.0,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Today's Task",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: todos.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/placeholder.png",
                                color: greyColor.withOpacity(0.3),
                                height: screenHeight * 0.3),
                            Text(
                              "No Task found",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: greyColor.withOpacity(0.5)),
                            )
                          ],
                        )
                      : ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05, vertical: 16),
                              child: TodoCard(
                                title: todos[index].title,
                                endTime: todos[index].endTime,
                                isCompleted: todos[index].isCompleted,
                                startTime: todos[index].startTime,
                                imagePath: _getImageLink(todos[index].category),
                                onTap: () async {
                                  final Todo todo = await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) => UpdateTodo(
                                                todo: todos[index],
                                              )));
                                  if (todo.title == "DELETETODO") {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                  } else if (todo.title != "") {
                                    setState(() {
                                      todos[index] = todo;
                                    });
                                  }
                                },
                                onValueChanged: (value) {
                                  setState(() {
                                    todos[index].isCompleted = value;
                                  });
                                },
                              ),
                            );
                          }),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: blueColor,
              onPressed: () async {
                final Todo todo = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddTodo()));
                if (todo.title != "") {
                  setState(() {
                    todos.add(todo);
                  });
                }
              },
              child: Icon(
                Icons.add,
                color: whiteColor,
              ),
            )));
  }
}
