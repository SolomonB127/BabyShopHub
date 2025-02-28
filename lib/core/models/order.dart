import 'package:baby_shop_hub/provider/cart_provider.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final DateTime date;
  final double total;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.date,
    required this.total,
    this.status = "Processing",
  });
}
