import 'package:flutter/cupertino.dart';

class InternDetails {
  final String category;
  final String company;
  final DateTime todayDaaate;
  final double package;
  bool isfavorite = false;
  final String cloudID;
  final String firm;
  final String jobD;
  final String skill;
  final String img;

  InternDetails({
    required this.firm,
    required this.jobD,
    required this.skill,
    required this.img,
    required this.category,
    required this.company,
    required this.todayDaaate,
    required this.package,
    required this.isfavorite,
    required this.cloudID,
  });
}
