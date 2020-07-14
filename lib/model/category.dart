import 'package:flutter/foundation.dart';

class CategoryData {
  CategoryData({this.title, this.items});
  final String title;
  final List<CategoryItemData> items;
}

class CategoryItemData {
  CategoryItemData(
      {@required this.image, @required this.title, @required this.stock});
  final String image;
  final String title;
  final String stock;
}
