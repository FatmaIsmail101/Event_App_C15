import 'package:flutter/cupertino.dart';

class CategoryData{
  final  String name;
  final String imgPath;
  final  IconData iconData;
final String id;
  CategoryData({ required this.id,
    required this.iconData,
    required this.name, required this.imgPath});
}