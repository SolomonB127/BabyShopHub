import 'package:flutter/material.dart';
import '../../core/models/products.dart';

/// A model for an item in the cart.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

/// A provider to manage the cart state.
class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  /// Adds a product to the cart.
  void addItem(Product product) {
    // Check if product already exists in the cart.
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      // If it exists, increment the quantity.
      _items[index].quantity++;
    } else {
      // Otherwise, add a new cart item.
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  /// Optionally, remove a product or reduce its quantity.
  void removeItem(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// Clears all items from the cart.
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// Returns the total number of items in the cart.
  int get totalItems {
    return _items.fold(0, (total, item) => total + item.quantity);
  }
}
