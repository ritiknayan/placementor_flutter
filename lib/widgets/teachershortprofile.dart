import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:palcmentor/model/teacherdetails.dart';

class TeacherShortProfile extends StatelessWidget {
  TeacherShortProfile({super.key, required this.teacher});
  final TeacherDetails teacher;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 180,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/user.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              teacher.name,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.dprt,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.mobile_no,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              teacher.email,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ]),
        ));
  }
}
