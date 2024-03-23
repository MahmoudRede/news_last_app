import 'package:flutter/cupertino.dart';

class MyProfileItemModel {
  final IconData icon;
  final String title;
  final Function()? function;


  const MyProfileItemModel(this.function, {required this.icon, required this.title});
}
