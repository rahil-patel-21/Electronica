import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CloudBase {
  Future<Map<String, String>> productList();
  Stream<QuerySnapshot> get products;
  Future<String> getStockData(String category);
}

class Cloud implements CloudBase {
  final _fireStore = Firestore.instance;

  @override
  Future<Map<String, String>> productList() async {
    Map<String, String> productList = {};
    QuerySnapshot querySnapshot =
        await _fireStore.collection("Product Categories").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      productList[querySnapshot.documents[i].documentID] =
          querySnapshot.documents[i].data['photoURL'];
    }

    return productList;
  }

  @override
  Stream<QuerySnapshot> get products => _fireStore
      .collection("Product Categories")
      .document("Mobiles")
      .collection('Popular')
      .snapshots();

  @override
  Future<String> getStockData(String category) async {
    String stockData = "";
    await _fireStore
        .collection("Product Categories")
        .document(category)
        .collection('Popular')
        .getDocuments()
        .then((value) {
      stockData = value.documents.length.toString();
    });
    return stockData;
  }
}
