import 'package:electronica/Pages/product_list.dart';
import 'package:electronica/app_state.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final bool isCollapsed;
  Categories({@required this.isCollapsed}) : assert(isCollapsed != null);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> _categoriesItems = [];

  @override
  Widget build(BuildContext context) {
    AppState.categories.forEach((f) {
      _categoriesItems.add(Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15.0),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Text(f.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NoeMedium')),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: f.items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductList(
                                  categoryName: f.items[index].title,
                                  categoryStock: f.items[index].stock,
                                  categoryPhotoURL: f.items[index].image,
                                ))),
                    child: Container(
                      margin: index == 0
                          ? EdgeInsets.only(left: 10.0)
                          : EdgeInsets.only(left: 0.0),
                      child: CategoryCard(
                        image: f.items[index].image,
                        title: f.items[index].title,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ));
    });

    return Container(
      decoration: BoxDecoration(
        color: widget.isCollapsed ? Color(0xFF08080A) : Color(0xFF121212),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _categoriesItems,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({Key key, this.image, this.title, this.tag}) : super(key: key);

  final String image;
  final String title;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.0),
              ])),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        ),
      ),
    );
  }
}
