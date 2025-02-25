import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/screens/categories/category_filters.dart';
import 'package:baby_shop_hub/presentation/widgets/common/search_tile.dart';
import 'package:baby_shop_hub/data/services/product_service.dart';
import 'package:flutter/material.dart';
import '../../../core/models/products.dart';
import 'package:baby_shop_hub/presentation/widgets/specific/product_card.dart';
import 'package:baby_shop_hub/presentation/widgets/common/cart_icon.dart'; // Import the dedicated CartIcon

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ProductService _productService = ProductService();
  List<Product> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _onSearch(_searchController.text);
    });
  }

  void _onSearch(String query) async {
    setState(() {
      _isSearching = query.isNotEmpty;
    });

    if (!_isSearching) {
      _searchResults.clear();
      return;
    }

    // Fetch and filter products
    final products = await _productService.fetchProducts();
    final filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _searchResults = filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // SEARCH BAR & CART ICON
            Container(
              width: double.infinity,
              color: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SearchTile(
                      controller: _searchController,
                      hintText: "Search Here",
                      icon: IconButton(
                        onPressed: () => _onSearch(_searchController.text),
                        icon: const Icon(Icons.search),
                        color: Colors.grey,
                      ),
                      onChanged: _onSearch,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Replace the hardcoded cart icon with the dedicated CartIcon widget.
                  const CartIcon(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // DISPLAY CATEGORY FILTERS OR SEARCH RESULTS
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _isSearching
                    ? _buildSearchResults()
                    : const CategoryFilters(), // Show filters if no search
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the search result UI
  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(
        child: Text("No results found", style: TextStyle(fontSize: 16)),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return ProductCard(product: _searchResults[index]);
      },
    );
  }
}
