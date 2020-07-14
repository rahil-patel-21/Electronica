import 'package:electronica/constants/temp.dart';

import './model/category.dart';

class AppState {
  static List<CategoryData> categories = [
    CategoryData(title: 'Exclusive Offers', items: [
      CategoryItemData(image: photoURL_Laptop, title: 'Laptops', stock: '31'),
      CategoryItemData(image: photoURL_Console, title: 'Consoles', stock: '9'),
      CategoryItemData(
          image: photoURL_Speakers, title: 'Speakers', stock: '22'),
      CategoryItemData(image: photoURL_Watches, title: 'Watches', stock: '19'),
    ]),
    CategoryData(title: 'Huge Cashback', items: [
      CategoryItemData(image: photoURL_TVs, title: 'Smart TV', stock: '33'),
      CategoryItemData(image: photoURL_PC, title: 'PC', stock: '19'),
      CategoryItemData(image: photoURL_Mobiles, title: 'Mobiles', stock: '55'),
      CategoryItemData(
          image: photoURL_Earphones, title: 'Earphones', stock: '26'),
    ]),
  ];
}

// import './model/category.dart';

// class AppState {
//   static List<CategoryData> categories = [
//     CategoryData(title: 'Exclusive Offers', items: [
//       CategoryItemData(
//           image: 'assets/images/product_004.jpg', title: 'Laptops'),
//       CategoryItemData(
//           image: 'assets/images/product_003.jpg', title: 'Consoles'),
//       CategoryItemData(
//           image: 'assets/images/product_002.jpg', title: 'Speakers'),
//       CategoryItemData(
//           image: 'assets/images/product_006.jpg', title: 'Watches'),
//     ]),
//     CategoryData(title: 'Huge Cashback', items: [
//       CategoryItemData(
//           image: 'assets/images/product_011.jpg', title: 'Smart TV'),
//       CategoryItemData(image: 'assets/images/product_009.jpg', title: 'PC'),
//       CategoryItemData(
//           image: 'assets/images/product_010.jpg', title: 'Mobiles'),
//       CategoryItemData(
//           image: 'assets/images/product_007.jpg', title: 'Earphones'),
//     ]),
//     CategoryData(title: 'Value For Money', items: [
//       CategoryItemData(
//           image: 'assets/images/product_006.jpg', title: 'Watches'),
//       CategoryItemData(
//           image: 'assets/images/product_004.jpg', title: 'Laptops'),
//       CategoryItemData(
//           image: 'assets/images/product_009.jpg', title: 'PC Hardware'),
//       CategoryItemData(
//           image: 'assets/images/product_012.jpg', title: 'Chargers'),
//     ]),
//   ];
// }
