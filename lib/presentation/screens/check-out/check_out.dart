// File: lib/presentation/screens/checkout/checkout_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baby_shop_hub/provider/cart_provider.dart';
import 'package:baby_shop_hub/provider/order_provider.dart';
import 'package:baby_shop_hub/core/models/order.dart';
import 'package:uuid/uuid.dart';
import 'package:baby_shop_hub/core/theme/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isProcessing = false;

  void _processCheckout() async {
    setState(() {
      _isProcessing = true;
    });

    // Simulate a dummy payment process
    await Future.delayed(const Duration(seconds: 2));

    // Prepare order details from the cart
    // ignore: use_build_context_synchronously
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    // ignore: use_build_context_synchronously
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final items = cartProvider.items;
    final total = items.fold(0.0,
        (sum, item) => sum + item.product.price * item.quantity);

    final newOrder = Order(
      id: const Uuid().v4(),
      items: List.from(items),
      date: DateTime.now(),
      total: total,
      status: "Processing",
    );

    // Add order to history and clear the cart
    orderProvider.addOrder(newOrder);
    cartProvider.clearCart();

    setState(() {
      _isProcessing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order placed successfully! Navigate to Profile page for Order Tracking")),
    );

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final items = cartProvider.items;
    final total = items.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: items.isEmpty
            ? const Center(child: Text("Your cart is empty"))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Review",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ListTile(
                          title: Text(item.product.name),
                          subtitle: Text("Quantity: ${item.quantity}"),
                          trailing: Text(
                            "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("\$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isProcessing ? null : _processCheckout,
                      child: _isProcessing
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Place Order"),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
