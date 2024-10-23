// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _HomepageState();
}

TextEditingController _dateController = TextEditingController();

class _HomepageState extends State<AddTodo> {
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
                TextFormField(
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
                SizedBox(
                  height: 200, //     <-- TextField expands to this height.
                  child: TextFormField(
                    maxLines: null, // Set this
                    expands: true, // and this
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
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_today),
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
                TextFormField(
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
                    hintText: 'Add Time',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
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

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
