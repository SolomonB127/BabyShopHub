import 'package:baby_shop_hub/core/theme/app_colors.dart';
import 'package:baby_shop_hub/presentation/screens/categories/categories_screen.dart';
import 'package:baby_shop_hub/presentation/screens/help/help_screen.dart';
import 'package:baby_shop_hub/presentation/screens/home/home_screen.dart';
import 'package:baby_shop_hub/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  void _onNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Update the pages list to pass the callback to HomeScreen
  List<Widget> get _pages => [
        HomeScreen(
          onSeeMore: () {
            _onNavigationItemTapped(1);
          },
        ),
        const CategoriesScreen(),
        const ProfileScreen(),
        const HelpScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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
