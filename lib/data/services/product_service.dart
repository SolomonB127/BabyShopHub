import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/models/products.dart';

class ProductService {
  final _supabase = Supabase.instance.client;

  Future<List<Product>> fetchProducts() async {
    final response = await _supabase.from('product').select();
    return response.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> searchProducts(String query) async {
    if (query.isEmpty) return fetchProducts(); // If empty, return all products

    final response = await _supabase
        .from('product')
        .select()
        .ilike('name', '%$query%'); // Case-insensitive search on product name

    return response.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
