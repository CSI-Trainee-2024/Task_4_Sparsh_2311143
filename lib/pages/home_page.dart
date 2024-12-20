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
  List<String> categories = [];

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

  _updateCategories() {
    List<String> cats = [];
    for (int i = 0; i < todos.length; i++) {
      if (!cats.contains(todos[i].category)) {
        cats.add(todos[i].category);
      }
    }
    setState(() {
      categories = cats;
    });
  }
  // _getImageLink(String category) {
  //   if (category == "Design") {
  //     return "assets/design.png";
  //   } else if (category == "Development") {
  //     return "assets/development.png";
  //   } else {
  //     return "assets/research.png";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
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
                todos.isEmpty
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, ind) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05),
                                child: Text(
                                  categories[ind],
                                  style: TextStyle(
                                      fontSize: 18, color: blackcolor),
                                ),
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: todos.length,
                                  itemBuilder: (context, index) {
                                    if (todos[index].category ==
                                        categories[ind]) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.05,
                                            vertical: 16),
                                        child: TodoCard(
                                          title: todos[index].title,
                                          endTime: todos[index].endTime,
                                          isCompleted: todos[index].isCompleted,
                                          startTime: todos[index].startTime,
                                          onTap: () async {
                                            final Todo todo =
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateTodo(
                                                              todo:
                                                                  todos[index],
                                                            )));

                                            setState(() {
                                              if (todo.title == "DELETETODO") {
                                                todos.removeAt(index);
                                              } else if (todo.title != "") {
                                                todos[index] = todo;
                                              }
                                            });
                                            _updateCategories();
                                          },
                                          onValueChanged: (value) {
                                            setState(() {
                                              todos[index].isCompleted = value;
                                            });
                                          },
                                        ),
                                      );
                                    }
                                    return Container();
                                  }),
                            ],
                          );
                        })
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: blueColor,
              onPressed: () async {
                final Todo todo = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddTodo()));
                if (todo.title != "") {
                  setState(() {
                    todos.add(todo);
                    if (!categories.contains(todo.category)) {
                      categories.add(todo.category);
                    }
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
