import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });

  get imagePath => null;
}

class CartModel extends ChangeNotifier {
  Map<String, CartItem> _items = {};
  final double _deliveryCharge = 39.0; // Example fixed delivery charge
  final double _discount = 0.0; // Example discount, can be dynamic based on promotions

  Map<String, CartItem> get items => _items;

  double get subtotal => _items.values
      .map((item) => item.price * item.quantity)
      .fold(0.0, (sum, itemTotal) => sum + itemTotal);

  double get totalAmount => subtotal + _deliveryCharge - _discount;

  int get itemCount => _items.length;

  double get deliveryCharge => _deliveryCharge;

  double get discount => _discount;

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // Increase quantity
      _items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Add item
      _items.putIfAbsent(
        productId,
            () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void addProduct(String name, double price) {
    String productId = UniqueKey().toString(); // Unique identifier for each product
    addItem(productId, name, price);
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
