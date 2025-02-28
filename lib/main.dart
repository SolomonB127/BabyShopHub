import 'package:baby_shop_hub/presentation/screens/help/FAQs/faqs_screen.dart';
import 'package:baby_shop_hub/presentation/screens/help/Shipping_Delivery/shipping_delivery.dart';
import 'package:baby_shop_hub/presentation/screens/help/contact_us/contact_us.dart';
import 'package:baby_shop_hub/presentation/screens/help/payment_options/payment_options.dart';
import 'package:baby_shop_hub/presentation/screens/help/returns_exchnages/returns_exchanges.dart';
import 'package:baby_shop_hub/presentation/screens/splash/splash_screen.dart';
import 'package:baby_shop_hub/presentation/screens/terms-conditions/terms_conditions.dart';
import 'package:baby_shop_hub/provider/cart_provider.dart';
import 'package:baby_shop_hub/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
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

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
    ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/faqs': (context) => const FAQsScreen(),
        '/shipping': (context) => const ShippingDeliveryScreen(),
        '/returns': (context) => const ReturnsExchangesScreen(),
        '/payment': (context) => const PaymentOptionsScreen(),
        '/contact': (context) => const ContactUsScreen(),
        '/terms': (context) => const TermsConditions(),
      },
    );
  }
}
