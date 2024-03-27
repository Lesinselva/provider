import 'package:flutter/material.dart';
import 'package:pages/navbar/cart/cartdetails.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }
}
