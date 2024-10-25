// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/size.dart';

class TodoCard extends StatelessWidget {
  TodoCard(
      {required this.title,
      required this.endTime,
      required this.isCompleted,
      required this.onTap,
      required this.onValueChanged,
      required this.imagePath,
      required this.startTime});

  String title;
  String startTime;
  String endTime;
  bool isCompleted;
  String imagePath;
  final onTap;
  final onValueChanged;

  @override
  Widget build(BuildContext context) {
  
    return ListTile(
      tileColor: whiteColor,
      onTap:onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor.withOpacity(0.25)
        ),
        height: screenWidth * 0.15,
        width: screenWidth * 0.15,
        child: Image.asset(imagePath),
      ),
      title: Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      subtitle: Text("$startTime - $endTime",style: const TextStyle(fontSize: 16,color: greyColor),),
      trailing: CupertinoSwitch(value: isCompleted, onChanged: onValueChanged,activeColor: blueColor,),
    );
  }
}
