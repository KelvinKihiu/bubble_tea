import 'package:bubble_tea/models/drink.dart';
import 'package:flutter/widgets.dart';

class BubbleTeaShop extends ChangeNotifier {
  // List of drinks for sale
  final List<Drink> _shop = [
    Drink(
      name: 'Pearl Milk Tea',
      price: '4.00',
      imagePath: 'assets/images/pearls_milk_tea.png',
    ),
    Drink(
      name: 'Choco Milk Tea',
      price: '6.00',
      imagePath: 'assets/images/choco_milk_tea.png',
    ),
    Drink(
      name: 'Passion Milk Tea',
      price: '5.00',
      imagePath: 'assets/images/passion_milk_tea.png',
    ),
    Drink(
      name: 'Strawberry Milk Tea',
      price: '4.50',
      imagePath: 'assets/images/strawberry_milk_tea.png',
    ),
  ];

  // List of drinks in user cart
  final List<Drink> _userCart = [];

  // Get drinks for sale
  List<Drink> get shop => _shop;

  // Get user cart
  List<Drink> get cart => _userCart;

  // Add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // Remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
