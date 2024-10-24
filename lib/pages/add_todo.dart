// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/shared/todo_list.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _HomepageState();
}

class _HomepageState extends State<AddTodo> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final TimeOfDay _timeOfDay = TimeOfDay.now();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked =
        await showTimePicker(initialTime: _timeOfDay, context: context);

    if (picked != null) {
      setState(() {
        _timeController.text =
            "${picked.hour.toString()}H : ${picked.minute.toString()}M";
      });
    }
  }

  void createTODO() {
    final Todo todo = Todo(
        title: _titleController.text,
        description: _descController.text,
        date: _dateController.text,
        time: _timeController.text);
    todos.add(todo);
    _titleController.clear();
    _descController.clear();
    _dateController.clear();
    _timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ADD TASK",
                  style: TextStyle(
                    color: redcolor,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _titleController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: darkBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Add a Todo',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ADD DESCRIPTION",
                  style: TextStyle(
                    color: redcolor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: TextFormField(
                    controller: _descController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: darkBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Add Description',
                     
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  "ADD DATE",
                  style: TextStyle(
                    color: redcolor,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: greyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: darkBlueColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Date',
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate();
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  "ADD TIME",
                  style: TextStyle(
                    color: redcolor,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                    controller: _timeController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.timer_sharp),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: darkBlueColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Add Time',
                    ),
                    readOnly: true,
                    onTap: _selectTime),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: createTODO,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [darkBlueColor, lightBlueColor],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey)),
                    child: const Text(
                      "Create Todo",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    ));
  }
}
