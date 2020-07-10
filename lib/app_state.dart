import './model/category.dart';
import './model/user.dart';
import 'package:rxdart/rxdart.dart';

class AppState {
  final user = BehaviorSubject<User>.seeded(User(isLogged: false));

  final List<CategoryData> categories = [
    CategoryData(title: 'Exclusive Offers', items: [
      CategoryItemData(
          image: 'assets/images/product_004.jpg', title: 'Laptops'),
      CategoryItemData(
          image: 'assets/images/product_003.jpg', title: 'Consoles'),
      CategoryItemData(
          image: 'assets/images/product_002.jpg', title: 'Speakers'),
      CategoryItemData(
          image: 'assets/images/product_006.jpg', title: 'Watches'),
    ]),
    CategoryData(title: 'Huge Cashback', items: [
      CategoryItemData(
          image: 'assets/images/product_011.jpg', title: 'Smart TV'),
      CategoryItemData(image: 'assets/images/product_009.jpg', title: 'PC'),
      CategoryItemData(
          image: 'assets/images/product_010.jpg', title: 'Mobiles'),
      CategoryItemData(
          image: 'assets/images/product_007.jpg', title: 'Earphones'),
    ]),
    CategoryData(title: 'Value For Money', items: [
      CategoryItemData(
          image: 'assets/images/product_006.jpg', title: 'Watches'),
      CategoryItemData(
          image: 'assets/images/product_004.jpg', title: 'Laptops'),
      CategoryItemData(
          image: 'assets/images/product_009.jpg', title: 'PC Hardware'),
      CategoryItemData(
          image: 'assets/images/product_012.jpg', title: 'Chargers'),
    ]),
  ];
}
