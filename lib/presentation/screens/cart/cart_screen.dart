// File: lib/presentation/screens/cart/cart_screen.dart

import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final items = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart', style: TextStyle(color: AppColors.surface),),
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: items.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final cartItem = items[index];
                return ListTile(
                  leading: Image.network(
                    cartItem.product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(cartItem.product.name),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Text(
                    '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                  ),
                );
              },
            ),
    );
  }
}
