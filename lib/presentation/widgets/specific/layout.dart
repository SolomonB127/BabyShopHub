import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/screens/categories/categories_screen.dart';
import 'package:baby_shop_hub/presentation/screens/help/help_screen.dart';
import 'package:baby_shop_hub/presentation/screens/home/home_screen.dart';
import 'package:baby_shop_hub/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';


/// A widget that manages the overall layout of the app,
/// including the bottom navigation bar and corresponding pages.
class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  /// Index of the currently selected page.
  int _selectedIndex = 0;

  /// List of pages corresponding to the bottom navigation items.
  final List<Widget> _pages = [
    const HomeScreen(),         // Home/Products page.
    const CategoriesScreen(),       // Categories Selection page.
    const ProfileScreen(),  // Account page.
    const HelpScreen(),        // Help/Services page.
  ];

  /// Handles the bottom navigation bar item tap by updating the selected index.
  void _onNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the currently selected page.
      body: _pages[_selectedIndex],
      // Bottom Navigation Bar for page switching.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavigationItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primaryDark,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
        ],
      ),
    );
  }
}
