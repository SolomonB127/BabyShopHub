import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/widgets/common/search_tile.dart';
import 'package:baby_shop_hub/presentation/widgets/specific/product_card.dart';
import 'package:flutter/material.dart';
import 'package:baby_shop_hub/data/services/product_service.dart';
import '../../../core/models/products.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onSeeMore; // Callback to notify parent to switch to CategoriesScreen

  const HomeScreen({Key? key, required this.onSeeMore}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService productService = ProductService();
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = productService.fetchProducts();
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
                      hintText: "Search Here",
                      icon: IconButton(
                        onPressed: () {
                          // TODO - Add search functionality here.
                        },
                        icon: const Icon(Icons.search),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // PRODUCT LIST
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: AppColors.error),));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }

                  // Group products by category
                  final Map<String, List<Product>> groupedProducts = {};
                  for (var product in snapshot.data!) {
                    groupedProducts.putIfAbsent(product.category, () => []).add(product);
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: groupedProducts.entries.map((entry) {
                        List<Product> products = entry.value;
                        bool hasMoreThanFive = products.length > 5;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CATEGORY TITLE
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
                            // PRODUCTS ROW
                            SizedBox(
                              height: 280,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: hasMoreThanFive ? 6 : products.length,
                                itemBuilder: (context, index) {
                                  // "See More" button at the last slot if there are more than five products
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
                                  // Return the ProductCard for each product
                                  final product = products[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: ProductCard(product: product),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }).toList(),
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
}


