// File: lib/presentation/screens/cart/cart_screen.dart

import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/screens/check-out/check_out.dart';
import 'package:baby_shop_hub/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final items = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart', style: TextStyle(color: AppColors.surface)),
        backgroundColor: AppColors.primaryLight,
      ),
      backgroundColor: AppColors.surface,
      body: items.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                Provider.of<CartProvider>(context, listen: false)
                                    .removeItem(cartItem.product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('${cartItem.product.name} removed from cart'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Checkout Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the CheckoutScreen.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.surface),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
