import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/data/services/product_service.dart';
import 'package:baby_shop_hub/presentation/widgets/specific/product_card.dart';
import 'package:flutter/material.dart';
import '../../../core/models/products.dart';

class CategoryFilters extends StatefulWidget {
  const CategoryFilters({Key? key}) : super(key: key);

  @override
  _CategoryFiltersState createState() => _CategoryFiltersState();
}

class _CategoryFiltersState extends State<CategoryFilters> {
  final ProductService productService = ProductService();
  late Future<List<Product>> _products;
  List<String> _categories = [];
  String _activeCategory = "";

  @override
  void initState() {
    super.initState();
    _products = productService.fetchProducts().then((products) {
      // Extract unique category names
      final categories = products.map((p) => p.category).toSet().toList();
      setState(() {
        _categories = categories;
        if (_categories.isNotEmpty) {
          _activeCategory =
              _categories.first; // Set first category as default active
        }
      });
      return products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SIDEBAR CATEGORY FILTERS
        Container(
          width: 120, // Sidebar width
          color: AppColors.background, // Background color
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              String category = _categories[index];
              bool isActive = category == _activeCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _activeCategory = category;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primaryLight.withOpacity(0.3)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: isActive
                        ? Border(
                            left:
                                BorderSide(color: AppColors.primary, width: 4))
                        : null,
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isActive ? AppColors.primary : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // PRODUCT GRID
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: AppColors.error),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products found'));
              }

              // Filter products by active category
              final filteredProducts = snapshot.data!
                  .where((p) => p.category == _activeCategory)
                  .toList();

              return filteredProducts.isEmpty
                  ? const Center(child: Text("No products in this category"))
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Display 2 products per row
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: filteredProducts[index]);
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
