// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';
import 'package:todo_app/models/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _HomepageState();
}

class _HomepageState extends State<AddTodo> {
  final _form = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
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
    TimeOfDay? picked = await showTimePicker(
      initialTime: _timeOfDay,
      context: context,
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startTimeController.text =
            "${picked.hour.toString()}H : ${picked.minute.toString()}M";
      });
    }
  }

  void createTODO() {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      // final Todo todo = Todo(
      //     title: _titleController.text,
      //     description: _descController.text,
      //     date: _dateController.text,
      //     time: _startTimeController.text);
      // _titleController.clear();
      // _descController.clear();
      // _dateController.clear();
      // _startTimeController.clear();

      // Navigator.pop(context, todo);
    }
  }

  Text _getTextFormFieldHeading(String text) {
    return Text(text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  InputDecoration _getTextFormFieldInputDecoration() {
    return InputDecoration(
      fillColor: whiteColor,
      filled: true,
      focusColor: whiteColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  InputDecoration _getTextFormFieldInputDecorationWithIcon(Icon icon) {
    return InputDecoration(
      suffixIcon: icon,
      fillColor: whiteColor,
      filled: true,
      focusColor: whiteColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: _form,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              // Todo todo = Todo(
                              //     title: "",
                              //     description: "",
                              //     date: "",
                              //     time: "");
                              // Navigator.pop(context, todo);
                            },
                            icon: Icon(Icons.arrow_back)),
                      ),
                      Text(
                        "Create New Task",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10, width: 10)
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.08,
                  ),
                  _getTextFormFieldHeading("Task Name"),
                  TextFormField(
                      controller: _titleController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter a title";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecoration()),
                  SizedBox(
                    height: 20,
                  ),
                  _getTextFormFieldHeading("Description"),
                  SizedBox(
                    height: 100,
                    child: TextFormField(
                        controller: _descController,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a Desc";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecoration()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _getTextFormFieldHeading("Date"),
                  TextFormField(
                    controller: _dateController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Enter a Date";
                      }
                      return null;
                    },
                    decoration: _getTextFormFieldInputDecorationWithIcon(
                        Icon(Icons.calendar_month_outlined)),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: _getTextFormFieldHeading("Start Time")),
                      SizedBox(width: 20),
                      Expanded(child: _getTextFormFieldHeading("End Time"))
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                            controller: _startTimeController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Enter a Time";
                              }
                              return null;
                            },
                            decoration:
                                _getTextFormFieldInputDecorationWithIcon(
                                    Icon(Icons.timer_outlined)),
                            readOnly: true,
                            onTap: _selectTime),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                            controller: _startTimeController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "Enter a Time";
                              }
                              return null;
                            },
                            decoration:
                                _getTextFormFieldInputDecorationWithIcon(
                                    Icon(Icons.timer_outlined)),
                            readOnly: true,
                            onTap: _selectTime),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  GestureDetector(
                    onTap: createTODO,
                    child: Container(
                      alignment: Alignment.center,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("Create Task",
                          style: TextStyle(fontSize: 20, color: whiteColor)),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
