import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:palcmentor/model/oncampous_intern_data.dart';

class offcampousDetail extends StatelessWidget {
  final InternDetails data;
  const offcampousDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(5),
            width: 40,
            height: 40,
            child: Image.asset(
              'assets/images/lightbulb.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            data.category,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            data.company,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          // Text(
          //   '${data.package}LPA',
          //   textAlign: TextAlign.left,
          //   style: TextStyle(
          //     fontSize: 12,
          //   ),
          // ),
        ]),
      ),
    );
  }
}
