import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      backgroundColor: Color.fromARGB(120, 96, 96, 93),
      title: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Resources',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 25,
              fontFamily: 'Pacifico',
              color: Color.fromARGB(255, 9, 8, 8)),
        ),
      ),
    );

    final mq = MediaQuery.of(context);
    final avlH =
        mq.size.height - appbar.preferredSize.height - mq.padding.top - 55;
    return Scaffold(
      appBar: appbar,
      body: Container(
        child: Column(children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.all(8),
            child: Container(
              height: 100,
              width: 500,
              alignment: Alignment.center,
              child: Text(
                'Sample Resume \n This repo contains all the resume of students',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'LibreBaskerville',
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.all(8),
            child: Container(
              height: 100,
              width: 500,
              alignment: Alignment.center,
              child: Text(
                'Tutorial Video Link \n This contain tutorial videos for interview preparation',
                style: TextStyle(fontSize: 20, fontFamily: 'LibreBaskerville'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}



//  SizedBox(
//             height: 50,
//           ),
//           Card(
//             elevation: 10,
//             margin: EdgeInsets.all(5),
//             child: Container(
//               height: 50,
//               width: 230,
//               alignment: Alignment.center,
//               child: Text(
//                 'Resources',
//                 style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
//               ),
//             ),
//           ),