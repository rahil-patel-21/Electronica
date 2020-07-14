import 'package:flutter/foundation.dart';

class Product {
  final String photoURL;
  final String description;
  final String price;
  final String reviewers;
  final String note;
  final String rating;
  final bool noteValue;
  Product(
      {@required this.photoURL,
      @required this.description,
      @required this.note,
      @required this.price,
      @required this.rating,
      @required this.reviewers,
      @required this.noteValue});
}
