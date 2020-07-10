import 'package:electronica/Animation/FadeAnimation.dart';
import 'package:electronica/Pages/upi_testing.dart';
import 'package:electronica/constants/product_list.dart';
import 'package:electronica/widget/categories.dart';
import 'package:electronica/widget/main_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreenHome extends StatefulWidget {
  @override
  _HomeScreenHomeState createState() => _HomeScreenHomeState();
}

class _HomeScreenHomeState extends State<HomeScreenHome> {
  double screenWidth;
  Duration duration = const Duration(milliseconds: 100);
  TextEditingController searchController = TextEditingController();
  bool isCollapsed = false;
  bool isSearching = false;
  String searchedString = ' ';

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return Stack(
      children: <Widget>[
        home(),
        searching(searchedString),
      ],
    );
  }

  Widget home() {
    return AnimatedPositioned(
      duration: duration,
      left: isCollapsed ? 0.55 * screenWidth : 0.0,
      right: isCollapsed ? -0.55 * screenWidth : 0.0,
      top: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF08080A)),
        child: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: isSearching ? Colors.white : Colors.transparent,
              title: isSearching
                  ? FadeAnimation(
                      1.0,
                      TextField(
                        controller: searchController,
                        onChanged: (String string) => setState(() {
                          searchedString = string;
                        }),
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.w600),
                        autofocus: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                searchController.clear();
                              },
                              child: Icon(Icons.clear),
                            ),
                            fillColor: Colors.white,
                            hintText: 'Search Your Product Here :)',
                            hintStyle: TextStyle(color: Colors.grey[600])),
                      ),
                    )
                  : Container(),
              leading: isSearching
                  ? FadeAnimation(
                      1.0,
                      IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => setState(() {
                                isSearching = !isSearching;
                              })))
                  : FadeAnimation(
                      1.0,
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () => setState(() {
                                isCollapsed = !isCollapsed;
                              }))),
              actions: isSearching
                  ? [Container()]
                  : [
                      FadeAnimation(
                          1.0,
                          IconButton(
                              icon: Icon(Icons.search, color: Colors.white),
                              onPressed: () => setState(() {
                                    isSearching = !isSearching;
                                  }))),
                      FadeAnimation(
                          1.0,
                          IconButton(
                              icon: Icon(Icons.shopping_cart,
                                  color: Colors.white),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(),
                                  )))),
                    ],
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: MainImage(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Categories(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget searchedWidget(String searchedString) {
    final List<String> searchedList = searchedString.isEmpty
        ? []
        : searchingList.where((String searchingString) {
            String searching = searchedString.toLowerCase();
            String subSearchingList = searchingString.toLowerCase();
            bool result = subSearchingList.contains(searching);

            return result;
          }).toList();
    print(searchedList.length);

    return searchedList.isNotEmpty && searchController.text.length > 0
        ? ListView.builder(
            itemCount: searchedList.length,
            itemBuilder: (context, index) {
              print(searchedList[index]);
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/product_006.jpg'))),
                              ),
                              SizedBox(width: 15.0),
                              Text(
                                searchedList[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Transform.rotate(
                              angle: 270 * math.pi / 180,
                              child: Icon(
                                Icons.call_made,
                                color: Colors.white70,
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, left: 60),
                        color: Colors.white,
                        height: 1.0,
                        width: double.infinity,
                      )
                    ],
                  ));
            },
          )
        : Container();
  }

  Widget searching(String izz) {
    return isSearching
        ? FadeAnimation(
            1.0,
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900].withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(
                  top: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top +
                      5.0,
                  left: 5,
                  right: 5),
              height: double.infinity,
              width: double.infinity,
              child: searchedWidget(izz),
            ),
          )
        : Container();
  }
}
