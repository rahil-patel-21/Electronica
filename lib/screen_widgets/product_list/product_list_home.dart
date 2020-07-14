// import 'package:electronica/Animation/FadeAnimation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:electronica/constants/product_list.dart';
// import 'package:electronica/firebase%20stuffs/fireStore_Controller.dart';
// import 'package:electronica/model/product.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// class ProductListHome extends StatefulWidget {
//   final String categoryName;
//   final String categoryStock;
//   final String categoryPhotoURL;
//   ProductListHome(
//       {@required this.categoryName,
//       @required this.categoryStock,
//       @required this.categoryPhotoURL})
//       : assert(categoryName != null &&
//             categoryStock != null &&
//             categoryPhotoURL != null);
//   @override
//   _ProductListHomeState createState() => _ProductListHomeState();
// }

// class _ProductListHomeState extends State<ProductListHome> {
//   bool isSearching = false;
//   bool isCollapsed = false;
//   TextEditingController searchController = TextEditingController();
//   String searchedString = " ";
//   String stockData = "x";

//   @override
//   void initState() {
//     super.initState();
//     getStockData(widget.categoryName);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     searchController.dispose();
//   }

//   void getStockData(String category) {
//     final cloudBase = Provider.of<CloudBase>(context, listen: false);
//     cloudBase.getStockData(category).then((value) => setState(() {
//           stockData = value;
//         }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF08080A),
//       appBar: AppBar(
//         backgroundColor: isSearching ? Colors.white : Colors.transparent,
//         title: isSearching
//             ? FadeAnimation(
//                 1.0,
//                 TextField(
//                   controller: searchController,
//                   onChanged: (String string) => setState(() {
//                     searchedString = string;
//                   }),
//                   style: TextStyle(
//                       color: Colors.white70, fontWeight: FontWeight.w600),
//                   autofocus: true,
//                   cursorColor: Colors.white,
//                   decoration: InputDecoration(
//                       suffix: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             searchController.clear();
//                           });
//                         },
//                         child: Icon(Icons.clear),
//                       ),
//                       fillColor: Colors.white,
//                       hintText: ' Search Your Product Here :)',
//                       hintStyle: TextStyle(color: Colors.grey[600])),
//                 ),
//               )
//             : Container(),
//         leading: FadeAnimation(
//             1.0,
//             IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () => setState(() {
//                       isSearching = !isSearching;
//                       searchController.clear();
//                     }))),
//         actions: isSearching
//             ? [Container()]
//             : [
//                 FadeAnimation(
//                     1.0,
//                     IconButton(
//                         icon: Icon(Icons.search, color: Colors.white),
//                         onPressed: () => setState(() {
//                               isSearching = !isSearching;
//                             }))),
//                 FadeAnimation(
//                     1.0,
//                     IconButton(
//                         icon: Icon(Icons.shopping_cart, color: Colors.white),
//                         onPressed: () => null)),
//                 FadeAnimation(
//                     1.0,
//                     IconButton(
//                         icon: Icon(Icons.filter_list, color: Colors.white),
//                         onPressed: () => null)),
//               ],
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             FadeAnimation(
//               1.0,
//               Card(
//                 color: Color(0xFF121212),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.categoryName,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25.0,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'NoeMedium',
//                                 letterSpacing: 1.2),
//                           ),
//                           SizedBox(
//                             height: 5.0,
//                           ),
//                           Text("Total " + stockData + " Found in  Stock",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'PlayFair',
//                                   fontWeight: FontWeight.w500)),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5.0),
//                         height: 80,
//                         width: 80,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                                 image: NetworkImage(widget.categoryPhotoURL),
//                                 fit: BoxFit.cover)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SliderMenu(categoryName: widget.categoryName),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SliderMenu extends StatefulWidget {
//   final String categoryName;
//   SliderMenu({@required this.categoryName}) : assert(categoryName != null);
//   @override
//   _SliderMenuState createState() => _SliderMenuState();
// }

// class _SliderMenuState extends State<SliderMenu> {
//   String sliderName = "Popular";
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.70,
//       color: Color(0xFF121212),
//       child: Row(
//         children: [
//           RotatedBox(
//               quarterTurns: 3,
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   color: Color(0xFF121212),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             sliderName = sliderList[0];
//                           });
//                         },
//                         child: Container(
//                           height: 30,
//                           padding: EdgeInsets.all(3),
//                           margin: EdgeInsets.all(2),
//                           decoration: BoxDecoration(
//                               color: sliderName == sliderList[0]
//                                   ? Colors.blueGrey[900]
//                                   : Color(0xFF121212),
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Text(
//                             sliderList[0],
//                             style: TextStyle(
//                                 color: sliderName == sliderList[0]
//                                     ? Colors.white
//                                     : Colors.grey,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Ubantu'),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 50,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             sliderName = sliderList[1];
//                           });
//                         },
//                         child: Container(
//                           height: 30,
//                           padding: EdgeInsets.all(3),
//                           margin: EdgeInsets.all(2),
//                           decoration: BoxDecoration(
//                               color: sliderName == sliderList[1]
//                                   ? Colors.blueGrey[900]
//                                   : Color(0xFF121212),
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Text(
//                             sliderList[1],
//                             style: TextStyle(
//                                 color: sliderName == sliderList[1]
//                                     ? Colors.white
//                                     : Colors.grey,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Ubantu'),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 50,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             sliderName = sliderList[2];
//                           });
//                         },
//                         child: Container(
//                           height: 30,
//                           padding: EdgeInsets.all(3),
//                           margin: EdgeInsets.all(2),
//                           decoration: BoxDecoration(
//                               color: sliderName == sliderList[2]
//                                   ? Colors.blueGrey[900]
//                                   : Color(0xFF121212),
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Text(
//                             sliderList[2],
//                             style: TextStyle(
//                               color: sliderName == sliderList[2]
//                                   ? Colors.white
//                                   : Colors.grey,
//                               fontSize: 22,
//                               fontFamily: 'Ubantu',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ))),
//           Container(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: Firestore.instance
//                   .collection("Product Categories")
//                   .document(widget.categoryName)
//                   .collection('Popular')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 List<Product> products = [];
//                 // final List<dynamic> products = snapshot.data['Products'];

//                 for (int index = 0;
//                     index < snapshot.data.documents.length;
//                     index++) {
//                   Product product = Product(
//                     photoURL: snapshot.data.documents[index]['PhotoURL'],
//                     description: snapshot.data.documents[index]['Description'],
//                     note: snapshot.data.documents[index]['Note'],
//                     noteValue: snapshot.data.documents[index]['NoteValue'],
//                     price: snapshot.data.documents[index]['Price'],
//                     reviewers: snapshot.data.documents[index]['Reviewers'],
//                     rating: snapshot.data.documents[index]['Ratings'],
//                   );
//                   products.add(product);
//                 }

//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       return FadeAnimation(
//                         0.9,
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 15, vertical: 5),
//                                       height: 120,
//                                       width: 70,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         image: DecorationImage(
//                                             image: NetworkImage(
//                                                 products[index].photoURL),
//                                             fit: BoxFit.cover),
//                                       ),
//                                     ),
//                                     !products[index].noteValue
//                                         ? Container(
//                                             alignment: Alignment.center,
//                                             margin: EdgeInsets.symmetric(
//                                                 horizontal: 15, vertical: 5),
//                                             height: 120,
//                                             width: 70,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                             ),
//                                             child: Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   vertical: 15),
//                                               height: 50,
//                                               padding: EdgeInsets.symmetric(
//                                                   vertical: 10),
//                                               color: Colors.black
//                                                   .withOpacity(0.85),
//                                               child: Text(
//                                                 "Not Available",
//                                                 style: TextStyle(
//                                                     color: Colors.red[700]),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             ),
//                                           )
//                                         : Container()
//                                   ],
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(vertical: 5),
//                                   height: 140,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         width: 200,
//                                         child: Text(products[index].description,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.w700,
//                                                 fontFamily: 'PlayFair',
//                                                 wordSpacing: 1.2,
//                                                 letterSpacing: 1.2)),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             child: Text(
//                                                 "Rs. " + products[index].price,
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 19,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: 'Ubantu',
//                                                 )),
//                                           ),
//                                           Row(
//                                             children: [
//                                               Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.green,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                                 padding: EdgeInsets.all(4),
//                                                 margin: EdgeInsets.all(2),
//                                                 child: Row(
//                                                   children: [
//                                                     Text(
//                                                       products[index].rating,
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontFamily: 'Ubuntu',
//                                                           fontWeight:
//                                                               FontWeight.w600),
//                                                     ),
//                                                     SizedBox(width: 3.0),
//                                                     Icon(
//                                                       Icons.star,
//                                                       color: Colors.white,
//                                                       size: 14,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               SizedBox(width: 5),
//                                               Text(
//                                                 '(${products[index].reviewers})',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               )
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                       Container(
//                                         child: Text(products[index].note,
//                                             style: TextStyle(
//                                                 color: products[index].noteValue
//                                                     ? Colors.green
//                                                     : Colors.red)),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(left: 90),
//                               color: Colors.grey,
//                               height: 0.5,
//                               width: double.infinity,
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:electronica/Animation/FadeAnimation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronica/constants/product_list.dart';
import 'package:electronica/firebase%20stuffs/fireStore_Controller.dart';
import 'package:electronica/model/product.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProductListHome extends StatefulWidget {
  final String categoryName;
  final String categoryStock;
  final String categoryPhotoURL;
  ProductListHome(
      {@required this.categoryName,
      @required this.categoryStock,
      @required this.categoryPhotoURL})
      : assert(categoryName != null &&
            categoryStock != null &&
            categoryPhotoURL != null);
  @override
  _ProductListHomeState createState() => _ProductListHomeState();
}

class _ProductListHomeState extends State<ProductListHome> {
  bool isSearching = false;
  bool isCollapsed = false;
  TextEditingController searchController = TextEditingController();
  String searchedString = " ";
  String stockData = "x";

  @override
  void initState() {
    super.initState();
    getStockData(widget.categoryName);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void getStockData(String category) {
    final cloudBase = Provider.of<CloudBase>(context, listen: false);
    cloudBase.getStockData(category).then((value) => setState(() {
          stockData = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                          setState(() {
                            searchController.clear();
                          });
                        },
                        child: Icon(Icons.clear),
                      ),
                      fillColor: Colors.white,
                      hintText: ' Search Your Product Here :)',
                      hintStyle: TextStyle(color: Colors.grey[600])),
                ),
              )
            : Container(),
        leading: FadeAnimation(
            1.0,
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => setState(() {
                      isSearching = !isSearching;
                      searchController.clear();
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
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () => null)),
                FadeAnimation(
                    1.0,
                    IconButton(
                        icon: Icon(Icons.filter_list, color: Colors.white),
                        onPressed: () => null)),
              ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeAnimation(
              1.0,
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.categoryName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NoeMedium',
                                letterSpacing: 1.2),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Total " + stockData + " Found in  Stock",
                              style: TextStyle(
                                  color: Colors.black,
                                  //fontFamily: 'PlayFair',
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(widget.categoryPhotoURL),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliderMenu(categoryName: widget.categoryName),
          ],
        ),
      ),
    );
  }
}

class SliderMenu extends StatefulWidget {
  final String categoryName;
  SliderMenu({@required this.categoryName}) : assert(categoryName != null);
  @override
  _SliderMenuState createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  String sliderName = "Popular";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.70,
      color: Colors.white,
      child: Row(
        children: [
          RotatedBox(
              quarterTurns: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sliderName = sliderList[0];
                          });
                        },
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: sliderName == sliderList[0]
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            sliderList[0],
                            style: TextStyle(
                                color: sliderName == sliderList[0]
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubantu'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sliderName = sliderList[1];
                          });
                        },
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: sliderName == sliderList[1]
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            sliderList[1],
                            style: TextStyle(
                                color: sliderName == sliderList[1]
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubantu'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sliderName = sliderList[2];
                          });
                        },
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: sliderName == sliderList[2]
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            sliderList[2],
                            style: TextStyle(
                              color: sliderName == sliderList[2]
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 22,
                              fontFamily: 'Ubantu',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection("Product Categories")
                  .document(widget.categoryName)
                  .collection('Popular')
                  .snapshots(),
              builder: (context, snapshot) {
                List<Product> products = [];
                // final List<dynamic> products = snapshot.data['Products'];

                for (int index = 0;
                    index < snapshot.data.documents.length;
                    index++) {
                  Product product = Product(
                    photoURL: snapshot.data.documents[index]['PhotoURL'],
                    description: snapshot.data.documents[index]['Description'],
                    note: snapshot.data.documents[index]['Note'],
                    noteValue: snapshot.data.documents[index]['NoteValue'],
                    price: snapshot.data.documents[index]['Price'],
                    reviewers: snapshot.data.documents[index]['Reviewers'],
                    rating: snapshot.data.documents[index]['Ratings'],
                  );
                  products.add(product);
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return FadeAnimation(
                        0.9,
                        Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      height: 120,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                products[index].photoURL),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    !products[index].noteValue
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            height: 120,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              height: 50,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              color: Colors.black
                                                  .withOpacity(0.85),
                                              child: Text(
                                                "Not Available",
                                                style: TextStyle(
                                                    color: Colors.red[700]),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(products[index].description,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'PlayFair',
                                                wordSpacing: 1.2,
                                                letterSpacing: 1.2)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                                "Rs. " + products[index].price,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Ubantu',
                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                padding: EdgeInsets.all(4),
                                                margin: EdgeInsets.all(2),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      products[index].rating,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Ubuntu',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(width: 3.0),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.white,
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '(${products[index].reviewers})',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        child: Text(products[index].note,
                                            style: TextStyle(
                                                color: products[index].noteValue
                                                    ? Colors.green
                                                    : Colors.red)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              color: Colors.grey,
                              height: 0.5,
                              width: double.infinity,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
