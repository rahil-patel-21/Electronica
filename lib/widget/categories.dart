import '../helpers/helper.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Widget> _categoriesItems = [];

  @override
  Widget build(BuildContext context) {
    state(context).categories.forEach((f) {
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
                  return Container(
                    margin: index == 0
                        ? EdgeInsets.only(left: 10.0)
                        : EdgeInsets.only(left: 0.0),
                    child: CategoryCard(
                      image: f.items[index].image,
                      title: f.items[index].title,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _categoriesItems,
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
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
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
