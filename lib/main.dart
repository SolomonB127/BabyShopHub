import 'package:baby_shop_hub/presentation/screens/home/home_screen.dart';
import 'package:baby_shop_hub/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: "../assets/.env");

  // Get SUPABASE_URL and SUPABASE_ANON_KEY, ensuring they are not null
  final supabaseUrl = dotenv.get("SUPABASE_URL", fallback: "");
  final supabaseAnonKey = dotenv.get("SUPABASE_ANON_KEY", fallback: "");

  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception("Missing Supabase environment variables!");
  }

  // Initialize Supabase
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
