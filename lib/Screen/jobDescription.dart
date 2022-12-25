// import 'dart:ffi';
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:palcmentor/widgets/usershortprofile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/oncampous_intern_data.dart';

class JobDescription extends StatefulWidget {
  final InternDetails data;
  const JobDescription({required this.data, super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  // late String username;
  // late String enroll;
  // late String moNumber;
  // get User{
  //   final userList=FirebaseFirestore.instance.collection("userDetails").snapshots().listen((event) {username=event.docs[4]['name'];
  //   enroll=event.docs[4]['name'];
  //   moNumber =event.docs[4]['name']; });
  // }
  Widget getUserProfile() {
    var username;
    var enroll;
    var moNumber;
    final userList = FirebaseFirestore.instance
        .collection("userDetails")
        .snapshots()
        .listen((event) {
      username = event.docs[3]['name'];
      enroll = event.docs.isEmpty ? "0901CS201011" : event.docs[3]['enroll'];
      moNumber = event.docs.isEmpty ? "7845632190" : event.docs[3]['mo_number'];
    });

    return UserShortProfile(
        name: username ?? "Ritik Nayan4",
        enroll: "0901CS201011",
        mobileNumber: "7845632190");
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      backgroundColor: Color.fromARGB(120, 96, 96, 93),
      title: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Text(
          'Job Description',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 25,
              fontFamily: 'Pacifico',
              color: Color.fromARGB(255, 9, 8, 8)),
        ),
      ),
    );

    final mq = MediaQuery.of(context);
    final avlH = mq.size.height - appbar.preferredSize.height - mq.padding.top;
    final avlW = mq.size.width;
    return Scaffold(
        appBar: appbar,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: avlW,
                height: avlH * 0.08,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      width: avlW * 0.24,
                      child: Image.network(
                        widget.data.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: avlW * 0.7,
                          height: avlH * 0.05,
                          child: FittedBox(
                            child: Text(
                              widget.data.category,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'LibreBaskerville',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: avlW * 0.7,
                          child: Text(
                            widget.data.company,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: avlH * 0.92,
                child: ListView(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'ABOUT THE FIRM',
                              style: TextStyle(
                                  fontFamily: 'Neuton',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 90,
                              // ignore: prefer_const_constructors
                              child: SingleChildScrollView(
                                  child: Text(
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.start,
                                widget.data.firm,
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              'JOB DESCRIPTION',
                              style: const TextStyle(
                                  fontFamily: 'Neuton',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 90,
                              child: SingleChildScrollView(
                                  child: Text(
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.start,
                                widget.data.jobD,
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'SKILLSET REQUIRED',
                              style: TextStyle(
                                  fontFamily: 'Neuton',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 90,
                              child: SingleChildScrollView(
                                child: Text(
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.start,
                                  widget.data.skill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 175,
                        width: 130,
                        child: Column(children: [
                          Text(
                            "PREVIOUSLY PLACED CONTACT",
                            style: TextStyle(
                                fontFamily: 'Neuton',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          getUserProfile()
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'EXPERINCES',
                              style: TextStyle(
                                  fontFamily: 'Neuton',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 90,
                              child: const SingleChildScrollView(
                                child: Text(
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.start,
                                    'The hackathon waay of recruiting people is amazing and it really evaluates who we are and how we look at solving problems, it also makes us feel good that we are HELPING NGO\'S'),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    'assets/images/man.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      'Ritik Nayan',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'LibreBaskerville',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '0901CS201011',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Merriweather',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ]));
  }
}







//  Container(
//                   width: double.infinity,
//                   child: Card(
//                       margin: const EdgeInsets.all(5),
//                       elevation: 7,
//                       shadowColor: Color.fromARGB(255, 129, 129, 127),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                             height: 649,
//                             child: ListView(
//                               children: [
//                                 Card(
//                                   elevation: 5,
//                                   child: Container(
//                                     margin: EdgeInsets.all(5),
//                                     height: 130,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'ABOUT THE FIRM',
//                                           style: TextStyle(
//                                               fontFamily: 'Neuton',
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 90,
//                                           // ignore: prefer_const_constructors
//                                           child: SingleChildScrollView(
//                                               child: Text(
//                                             style: TextStyle(fontSize: 16),
//                                             textAlign: TextAlign.start,
//                                             widget.data.firm,
//                                           )),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Card(
//                                   elevation: 5,
//                                   child: Container(
//                                     margin: EdgeInsets.all(10),
//                                     height: 130,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         // ignore: prefer_const_constructors
//                                         Text(
//                                           'JOB DESCRIPTION',
//                                           style: const TextStyle(
//                                               fontFamily: 'Neuton',
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 90,
//                                           child: SingleChildScrollView(
//                                               child: Text(
//                                             style: TextStyle(fontSize: 16),
//                                             textAlign: TextAlign.start,
//                                             widget.data.jobD,
//                                           )),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Card(
//                                   elevation: 5,
//                                   child: Container(
//                                     margin: EdgeInsets.all(10),
//                                     height: 130,
//                                     width: 500,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'SKILLSET REQUIRED',
//                                           style: TextStyle(
//                                               fontFamily: 'Neuton',
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 90,
//                                           child: SingleChildScrollView(
//                                             child: Text(
//                                               style: TextStyle(fontSize: 16),
//                                               textAlign: TextAlign.start,
//                                               widget.data.skill,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Card(
//                                   elevation: 5,
//                                   child: Container(
//                                     margin: EdgeInsets.all(10),
//                                     height: 175,
//                                     width: 130,
//                                     child: Column(children: [
//                                       Text(
//                                         "PREVIOUSLY PLACED CONTACT",
//                                         style: TextStyle(
//                                             fontFamily: 'Neuton',
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold),
//                                         textAlign: TextAlign.start,
//                                       ),
//                                       getUserProfile()
//                                     ]),
//                                   ),
//                                 ),
//                                 Card(
//                                   elevation: 5,
//                                   child: Container(
//                                     margin: EdgeInsets.all(10),
//                                     height: 200,
//                                     width: 500,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'EXPERINCES',
//                                           style: TextStyle(
//                                               fontFamily: 'Neuton',
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                           textAlign: TextAlign.start,
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Container(
//                                           height: 90,
//                                           child: const SingleChildScrollView(
//                                             child: Text(
//                                                 style: TextStyle(fontSize: 16),
//                                                 textAlign: TextAlign.start,
//                                                 'The hackathon waay of recruiting people is amazing and it really evaluates who we are and how we look at solving problems, it also makes us feel good that we are HELPING NGO\'S'),
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               margin: const EdgeInsets.all(5),
//                                               width: 50,
//                                               height: 50,
//                                               child: Image.asset(
//                                                 'assets/images/man.png',
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             Column(
//                                               children: const [
//                                                 Text(
//                                                   'Ritik Nayan',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     fontFamily:
//                                                         'LibreBaskerville',
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 16,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   '0901CS201011',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                     fontFamily: 'Merriweather',
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 //
//                               ],
//                             ),
//                           ),
//                         ],
//                       )))




//  Container(
//                 margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),


// Column(children: [
//                                     Text(
//                                       'NAME',
//                                       style: TextStyle(
//                                           fontFamily: 'Neuton',
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                     Text(
//                                       'enroll',
//                                       style: TextStyle(
//                                           fontFamily: 'Neuton',
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                     Text(
//                                       'mobile number',
//                                       style: TextStyle(
//                                           fontFamily: 'Neuton',
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ]),