import 'package:flutter/material.dart';
import 'package:palcmentor/model/oncampous_intern_data.dart';
import 'package:palcmentor/widgets/intern_data_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<InternDetails> suggestedDetailsList;
  CustomSearchDelegate({required this.suggestedDetailsList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<InternDetails> matchQuery = [];
    for (var element in suggestedDetailsList) {
      if (element.category.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InternDetail(data: result);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<InternDetails> matchQuery = [];
    for (var element in suggestedDetailsList) {
      if (element.category.toLowerCase().contains(query.toLowerCase()) ||
          element.company.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InternDetail(data: result);
      },
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import '../model/oncampous_intern_data.dart';
// import './intern_data_widget.dart';
// import './offcampousdetails.dart';

// class SearchedResults extends StatefulWidget {
//   SearchedResults({super.key, required this.interndetailsList});
//   late List<InternDetails> interndetailsList;

//   @override
//   State<SearchedResults> createState() => _SearchedResultsState();
// }

// class _SearchedResultsState extends State<SearchedResults> {
//   TextEditingController searchValue = TextEditingController();
//   late List<InternDetails> _foundedData = widget.interndetailsList;
//   onSearch() {
//     String search = searchValue.text;
//     setState(() {
//       _foundedData = widget.interndetailsList
//           .where((user) => (user.category.toLowerCase().contains(search) ||
//               user.category.toUpperCase().contains(search) ||
//               user.company.toLowerCase().contains(search) ||
//               user.category.toUpperCase().contains(search)))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey.shade900,
//         title: Container(
//           height: 38,
//           child: TextField(
//             controller: searchValue,
//             style: TextStyle(color: Color.fromARGB(255, 203, 203, 203)),
//             onChanged: (_) => onSearch(),
//             decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color.fromARGB(255, 88, 86, 86),
//                 contentPadding: EdgeInsets.all(0),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: Colors.grey.shade500,
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     borderSide: BorderSide.none),
//                 hintStyle: TextStyle(
//                     fontSize: 14, color: Color.fromARGB(255, 153, 146, 146)),
//                 hintText: "Search users"),
//           ),
//         ),
//       ),
//       body: Column(children: [
//         Container(
//           width: double.infinity,
//           height: 700,
//           child: ListView(
//             children: [
//               ..._foundedData.map((e) {
//                 return InternDetail(data: e);
//               }).toList()
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
