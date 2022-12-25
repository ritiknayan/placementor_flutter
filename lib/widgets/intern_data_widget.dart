// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/Screen/jobDescription.dart';
import '../model/oncampous_intern_data.dart';
import 'package:intl/intl.dart';

class InternDetail extends StatefulWidget {
  const InternDetail({super.key, required this.data});
  final InternDetails data;

  @override
  State<InternDetail> createState() => _InternDetailState();
}

class _InternDetailState extends State<InternDetail> {
  bool getFavorite(e) {
    if (e.isfavorite == null) e.isfavorite = false;
    return e.isfavorite;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final avlW = mq.size.width;
    final avlH = mq.size.height;
    return Container(
      height: avlH * 0.15,
      width: avlW,
      child: LayoutBuilder(
        builder: (ctx, constrain) {
          final F_CMW = constrain.maxWidth;
          final F_CMH = constrain.maxHeight;
          return GestureDetector(
              onTap: () {
                // Within the `FirstRoute` widget

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDescription(
                            data: widget.data,
                          )),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.fromLTRB(
                    F_CMW * 0.03, F_CMH * 0.07, F_CMW * 0.03, F_CMH * 0.07),
                elevation: 7,
                shadowColor: Color.fromARGB(255, 129, 129, 127),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(F_CMW * 0.02,
                              F_CMH * 0.03, F_CMW * 0.02, F_CMH * 0.03),
                          height: F_CMH * 0.6,
                          width: F_CMW * 0.2,
                          // height: 70,
                          child: widget.data.img.isEmpty
                              ? Image.asset(
                                  'assets/images/job-offer.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/2895265.jpg',
                                  // widget.data.img,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.fromLTRB(F_CMW * 0.01, 0, 0, 0),
                              width: F_CMW * 0.6,
                              height: F_CMH * 0.3,
                              child: Text(
                                widget.data.category,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Oswald',
                                    fontSize: F_CMH * 0.2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: F_CMW * 0.6,
                              margin:
                                  EdgeInsets.fromLTRB(F_CMW * 0.01, 0, 0, 0),
                              child: Text(
                                widget.data.company,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    fontSize: F_CMH * 0.12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: F_CMH * 0.1,
                          width: F_CMW * 0.3,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            DateFormat.yMMMd().format(widget.data.todayDaaate),
                            style: TextStyle(fontSize: F_CMH * 0.1),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                            width: F_CMW * 0.3,
                            height: F_CMH * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: F_CMW * 0.2,
                                  child: Text(
                                    '${widget.data.package} LPA',
                                    style: TextStyle(fontSize: F_CMH * 0.1),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Color.fromARGB(255, 197, 35, 84),
                                  radius: 10,
                                  onTap: (() {
                                    setState(() {
                                      // getFavorite(widget.data)
                                      //     ? widget.data.isfavorite = false
                                      //     : widget.data.isfavorite = true;
                                      if (getFavorite(widget.data)) {
                                        FirebaseFirestore.instance
                                            .collection('InternDetails')
                                            .doc(widget.data.cloudID)
                                            .update({'fav': false});
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('InternDetails')
                                            .doc(widget.data.cloudID)
                                            .update({'fav': true});
                                      }
                                    });
                                  }),
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      height: F_CMH * 0.2,
                                      width: F_CMW * 0.1,
                                      child: (getFavorite(widget.data)
                                          ? Icon(
                                              size: F_CMH * 0.2,
                                              Icons.favorite,
                                              color: Color.fromARGB(
                                                  255, 197, 35, 84),
                                            )
                                          : Icon(Icons.favorite_border,
                                              size: F_CMH * 0.2,
                                              color: Color.fromARGB(
                                                  255, 197, 35, 84)))),
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
