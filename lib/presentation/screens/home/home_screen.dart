import 'package:baby_shop_hub/data/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authService = AuthService();
  // logout button pressed
  void logout() async {
    await authService.signOut();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"),
      automaticallyImplyLeading: false,
      actions: [
        // logout
        IconButton(onPressed: logout, icon: Icon(Icons.logout))
      ],),
    );
  }
}