//Create a unique id using uuid
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();

//Date formater
final fomatedDate = DateFormat.yMd();

//enum for caegory
enum Category { food, travel, leasure, work }

//Category Icons
final categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leasure: Icons.sports,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
};

class ExpenceModel {
  //Constructor
  ExpenceModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get getFomatedDate {
    return fomatedDate.format(date);
  }
}
