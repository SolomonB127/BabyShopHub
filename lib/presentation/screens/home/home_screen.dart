import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/widgets/common/search_tile.dart';
import 'package:baby_shop_hub/presentation/widgets/specific/product_card.dart';
import 'package:flutter/material.dart';
import 'package:baby_shop_hub/data/services/product_service.dart';
import '../../../core/models/products.dart';
import 'package:baby_shop_hub/presentation/widgets/common/cart_icon.dart'; // Import the dedicated CartIcon

class HomeScreen extends StatefulWidget {
  final VoidCallback onSeeMore;

  const HomeScreen({Key? key, required this.onSeeMore}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService productService = ProductService();
  late Future<List<Product>> _products;
  List<Product> _filteredProducts = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _fetchInitialProducts();
  }

  void _fetchInitialProducts() {
    _products = productService.fetchProducts().then((products) {
      setState(() {
        _filteredProducts = products;
      });
      return products;
    });
  }

  void _onSearch(String query) async {
    setState(() {
      _isSearching = query.isNotEmpty;
    });

    if (!_isSearching) {
      _fetchInitialProducts();
      return;
    }

    List<Product> results = await productService.searchProducts(query);
    setState(() {
      _filteredProducts = results;
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
                  // Replace the original container with our dedicated CartIcon widget.
                  const CartIcon(),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // PRODUCT LIST WITH LOADING HANDLING
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Error fetching products"));
                  }

                  if (_isSearching) {
                    if (_filteredProducts.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _groupAndBuildProducts(_filteredProducts),
                      ),
                    );
                  }

                  if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products available"));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _groupAndBuildProducts(snapshot.data ?? []),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _groupAndBuildProducts(List<Product> products) {
    final Map<String, List<Product>> groupedProducts = {};
    for (var product in products) {
      groupedProducts.putIfAbsent(product.category, () => []).add(product);
    }

    return groupedProducts.entries.map((entry) {
      List<Product> products = entry.value;
      bool hasMoreThanFive = products.length > 5;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              entry.key,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hasMoreThanFive ? 6 : products.length,
              itemBuilder: (context, index) {
                if (hasMoreThanFive && index == 5) {
                  return GestureDetector(
                    onTap: widget.onSeeMore,
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "See More",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
        ],
      );
    }).toList();
  }
}
