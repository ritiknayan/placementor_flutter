import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToDoListChild extends StatelessWidget {
  final String title;
  const ToDoListChild({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      // alignment: Alignment.center,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Color.fromARGB(255, 129, 129, 127),
        child: Text(
          "TO-DO : $title  ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
