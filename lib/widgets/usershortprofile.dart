import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class UserShortProfile extends StatelessWidget {
  const UserShortProfile(
      {super.key,
      required this.name,
      required this.enroll,
      required this.mobileNumber});
  final String name;
  final String enroll;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 130,
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
              name,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              enroll,
              style: TextStyle(
                  fontFamily: 'Neuton',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            Text(
              mobileNumber,
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
