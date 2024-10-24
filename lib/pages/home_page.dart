// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/add_todo.dart';

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
        description:
            "Todo tdjfejkgfewkgewkg vnrergkerkgerkghergh nkgnergerg jnewkg fnewgerkg ",
        date: '2024-10-24',
        time: '2:30'),
    Todo(
        title: "App",
        description: "Todo task",
        date: '2024-10-24',
        time: '2:30'),
        Todo(
        title: "Sparsh",
        description: "Test Todo Description",
        date: '2024-10-24',
        time: '1:30'),
    Todo(
        title: "Gupta",
        description:
            "Todo tdjfejkgfewkgewkg vnrergkerkgerkghergh nkgnergerg jnewkg fnewgerkg ",
        date: '2024-10-24',
        time: '2:30'),
    Todo(
        title: "App",
        description: "Todo task",
        date: '2024-10-24',
        time: '2:30')
  ];

  double _getCompletedTodosValue() {
    int numberOfCompletedTodos = 0;
    for (int i = 0; i < todos.length; i++) {
      if (todos[i].isCompleted!) {
        numberOfCompletedTodos++;
      }
    }
    return (numberOfCompletedTodos / todos.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgroundColor,
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
                        backgroundColor: borderColor,
                        color: whiteColor,
                        minHeight: 10.0,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                
                Text("Today's Task",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05, vertical: 16),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05, vertical: 16),
                          color: whiteColor,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: screenWidth * 0.1,
                                    child: Image.asset("assets/splash_image.png"),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.025,
                                  ),
                                  Container(
                                    width: screenWidth * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          todos[index].title!,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(todos[index].description!)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.025,
                                  ),
                                  Container(
                                    width: screenWidth * 0.2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          todos[index].date!,
                                        ),
                                        Text(todos[index].time!),
                                        // Row(children: [
                                        //   IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 20,),
                                        //   IconButton(onPressed: (){}, icon: Icon(Icons.delete),iconSize: 20,)
                                        // ],)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  //IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 20,),
                                  Checkbox(
                                    value: todos[index].isCompleted,
                                    onChanged: (value) {
                                      setState(() {
                                        todos[index].isCompleted = value!;
                                      });
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.edit),
                                    iconSize: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        todos.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                    iconSize: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: darkBlueColor,
              ),
              backgroundColor: lightBlueColor,
              onPressed: () async {
                final Todo todo = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddTodo()));
                if (todo.title != "") {
                  setState(() {
                    todos.add(todo);
                  });
                }
              },
            )));
  }
}
