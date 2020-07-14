import '../screen_widgets/product_list/product_list_home.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final String categoryName;
  final String categoryStock;
  final String categoryPhotoURL;
  ProductList(
      {@required this.categoryName,
      @required this.categoryStock,
      @required this.categoryPhotoURL})
      : assert(categoryName != null &&
            categoryStock != null &&
            categoryPhotoURL != null);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductListHome(
          categoryName: widget.categoryName,
          categoryStock: widget.categoryStock,
          categoryPhotoURL: widget.categoryPhotoURL,
        ),
      ],
    );
  }
}
