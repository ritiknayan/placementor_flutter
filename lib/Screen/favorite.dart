import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/model/oncampous_intern_data.dart';

import '../widgets/intern_data_widget.dart';

class FavoritList extends StatelessWidget {
  FavoritList({super.key, required this.interndetailsList});
  final List<InternDetails> interndetailsList;
  final List<InternDetails> favoriteIntern = [];
  void FavListGenerator() {
    for (int i = 0; i < interndetailsList.length; i++) {
      if (interndetailsList[i].isfavorite) {
        favoriteIntern.add(interndetailsList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FavListGenerator();
    final appbar = AppBar(
      backgroundColor: Color.fromARGB(120, 96, 96, 93),
      title: Container(
        height: 45,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Field Of Interest',
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: avlH,
            child: ListView(
              children: [
                ...favoriteIntern.map((e) {
                  return InternDetail(data: e);
                }).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// SizedBox(
          //   height: 50,
          // ),
          // Card(
          //   elevation: 10,
          //   margin: EdgeInsets.all(5),
          //   child: Container(
          //     height: 45,
          //     width: 230,
          //     alignment: Alignment.center,
          //     child: Text(
          //       'Field Of Interest',
          //       style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
          //     ),
          //   ),
          // ),


        //     Card(
        //   elevation: 10,
        //   margin: EdgeInsets.all(5),
        //   child: Container(
        //     height: 45,
        //     width: 230,
        //     alignment: Alignment.center,
        //     child: Text(
        //       'Field Of Interest',
        //       style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
        //     ),
        //   ),
        // ),