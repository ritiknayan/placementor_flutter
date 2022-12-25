// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/Screen/favorite.dart';
import 'package:palcmentor/model/oncampous_intern_data.dart';
import 'package:palcmentor/widgets/intern_data_widget.dart';
import 'package:palcmentor/widgets/offcampusdetails.dart';
import 'package:palcmentor/widgets/searchedresult.dart';

class HomePage extends StatefulWidget {
  List<InternDetails> interndetailsList;

  HomePage({super.key, required this.interndetailsList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<InternDetails> interndetailsList = [
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

  // final List<InternDetails> favoriteIntern = [];
  // void FavListGenerator() {
  //   for (int i = 0; i < 3; i++) {
  //     print(2);
  //     print(getFavorite(interndetailsList[i]));
  //     if (interndetailsList[i].isfavorite) {
  //       print(3);
  //       favoriteIntern.add(interndetailsList[i]);
  //       print(favoriteIntern[i].company);
  //     }
  //   }
  // }
  // TextEditingController searchValue = TextEditingController();
  // late List<InternDetails> _foundedData;
  // onSearch() {
  //   String search = searchValue.text;
  //   setState(() {
  //     _foundedData = interndetailsList
  //         .where((user) => (user.category.toLowerCase().contains(search) ||
  //             user.category.toUpperCase().contains(search) ||
  //             user.company.toLowerCase().contains(search) ||
  //             user.category.toUpperCase().contains(search)))
  //         .toList();
  //   });
  // }

  bool getFavorite(e) {
    if (e.isfavorite == null) e.isfavorite = false;
    return e.isfavorite;
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.doesJumpToFav) {
    //   print('1');

    //   print(favoriteIntern);
    //   return Scaffold(
    //     body: Container(
    //       width: 500,
    //       height: 700,
    //       child: ListView(
    //         children: [
    //           ...favoriteIntern.map((e) {
    //             return InternDetail(data: e);
    //           }).toList()
    //         ],
    //       ),
    //     ),
    //   );
    // }
    // print(favoriteIntern);
    // print(interndetailsList[2].isfavorite);
    final appbar = AppBar(
      elevation: 0,
      backgroundColor: Colors.grey.shade900,
      title: Container(
        height: 40,
        child: ElevatedButton(
          // controller: searchValue,
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
              Text(
                "Search Field",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              )
            ],
          ),
          // onChanged: (_) => onSearch(),
          onPressed: () {
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                    suggestedDetailsList: widget.interndetailsList));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll<Color>(
                Color.fromARGB(255, 71, 71, 71)),
          ),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(50),
          //     borderSide: BorderSide.none),
        ),
      ),
    );
    final avlH = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appbar.preferredSize.height -
        55;
    final avlW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          height: avlH * 0.75,
          child: ListView(
            children: [
              ...widget.interndetailsList.map((e) {
                return InternDetail(data: e);
              }).toList()
            ],
          ),
        ),
        Container(
          width: 500,
          color: Color.fromARGB(255, 104, 104, 104),
          alignment: Alignment.center,
          child: Text(
            textWidthBasis: TextWidthBasis.parent,
            'Off-Campus Opportunity',
            style: TextStyle(
                wordSpacing: 10,
                // backgroundColor: Color.fromARGB(255, 104, 104, 104),
                color: Color.fromARGB(255, 255, 98, 7),
                fontSize: avlH * 0.03,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: avlH * 0.21,
          width: avlW,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...widget.interndetailsList.map((e) {
                return offcampousDetail(data: e);
              }).toList()
            ],
          ),
        )
      ]),
    );
  }
}
