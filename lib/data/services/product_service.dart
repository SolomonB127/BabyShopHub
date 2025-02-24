import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/models/products.dart';

class ProductService {
  final  _supabase = Supabase.instance.client;

  Future<List<Product>> fetchProducts() async {
    final response = await _supabase.from('product').select();
    
      return response.map<Product>((json) => Product.fromJson(json)).toList();
  }
}