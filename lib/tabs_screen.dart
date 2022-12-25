// import 'dart:html';
// import 'dart:html';

// import 'dart:html';
import 'dart:ui';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:palcmentor/Screen/favorite.dart';
import 'package:palcmentor/Screen/profile.dart';
import 'package:palcmentor/Screen/resources.dart';
import 'package:palcmentor/main.dart';
import './Screen/home.dart';
import './widgets/profile_content_widget.dart';
import './custom_animated_bottom_bar.dart';
import 'model/oncampous_intern_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<InternDetails> interndetailsList = [];

  // = [
  //   InternDetails(
  //       category: 'Unity 3D Developer VR ',
  //       company: 'MetaSpace',
  //       todayDaaate: DateTime.now(),
  //       package: 20.0),
  //   InternDetails(
  //       category: 'Unity 3D Developer VR ',
  //       company: 'MetaSpace',
  //       todayDaaate: DateTime.now(),
  //       package: 20.0),
  //   InternDetails(
  //       category: 'Software Associate',
  //       company: 'JPMC',
  //       todayDaaate: DateTime.now(),
  //       package: 14.5),
  //   InternDetails(
  //       category: 'Data Analyst',
  //       company: 'Google',
  //       todayDaaate: DateTime.now(),
  //       package: 12.0),
  //   InternDetails(
  //       category: 'Automotive Designers',
  //       company: 'Tesla',
  //       todayDaaate: DateTime.now(),
  //       package: 15.0),
  //   InternDetails(
  //       category: 'Unity 3D Developer VR ',
  //       company: 'MetaSpace',
  //       todayDaaate: DateTime.now(),
  //       package: 20.0)
  // ];

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    //final List<NewEntry> ent;
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Welcome"),
      //   backgroundColor: Colors.green[200],
      // ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('InternDetails').snapshots(),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: double.maxFinite,
              height: 500,
              child: SpinKitCircle(
                size: 60,

                // controller: AnimationController(
                //   vsync: this,
                //   duration: const Duration(milliseconds: 1200),
                // ),
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index.isEven
                          ? Colors.red
                          : Color.fromARGB(255, 239, 199, 2),
                    ),
                  );
                },
              ),
            );
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          // print(snapshot.data.document.length);
          // FirebaseFirestore.instance
          //     .collection('me')
          //     .snapshots()
          //     .listen((event) {});

          if (snapshot.data == null)
            return Container(
              width: double.maxFinite,
              height: 500,
              child: SpinKitSquareCircle(
                color: Colors.amber,
                size: 50,
                duration: Duration(seconds: 1),
              ),
              // child: SpinKitThreeInOut(
              //   itemBuilder: (BuildContext context, int index) {
              //     return DecoratedBox(
              //       decoration: BoxDecoration(
              //         color: index.isEven ? Colors.red : Colors.green,
              //       ),
              //     );
              //   },
              // ),
            );
          ;
          final InternDocoments = snapshot.data.docs;
//             const coll = collection(db, "");
// const ss = await getCountFromServer(coll);
// console.log('count: ', ss.data().count);
          int length = snapshot.data.docs.length;
          // FirebaseFirestore.instance
          //     .collection('InternDetails')
          //     .get()
          //     .then((value) => {length = value.size});
          // int Length = int.parse(FirebaseFirestore.instance
          //     .collection('InternDetails')
          //     .count()
          //     .toString());
          AsyncSnapshot.waiting();
          interndetailsList = List.generate(
            length,
            ((index) {
              return InternDetails(
                  firm: InternDocoments[index]['firm'],
                  jobD: InternDocoments[index]['jobD'],
                  skill: InternDocoments[index]['skill'],
                  img: InternDocoments[index]['img'],
                  category: InternDocoments[index]['cat'],
                  company: InternDocoments[index]['com'],
                  todayDaaate: DateTime.fromMillisecondsSinceEpoch(
                      InternDocoments[index]['date'].microsecondsSinceEpoch),
                  package:
                      double.parse(InternDocoments[index]['pkg'].toString()),
                  isfavorite: InternDocoments[index]['fav'],
                  cloudID: InternDocoments[index].id);
            }),
            growable: true,
          );
          return getBody();
        },
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 55,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: Colors.amber,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite_rounded),
          title: const Text('Favorite'),
          activeColor: Colors.red,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text(
            'Resource ',
          ),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(
        interndetailsList: interndetailsList,
      ),
      FavoritList(interndetailsList: interndetailsList),
      const Resources(),
      MyProfile()
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
