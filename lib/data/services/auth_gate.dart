/*
Auth-Gate - Will continuously listen for auth state change.

-----------------------------------------------------------------------------------------------------------------

unauthenticated users -> Splash Screen -> Onboarding Pages -> Login Screen
authenticated users -> Slash Screen -> Home Screen(Main Screen)

*/

import 'package:baby_shop_hub/presentation/screens/home/home_screen.dart';
import 'package:baby_shop_hub/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
    const AuthGate({super.key});

    @override
    Widget build(BuildContext context) {
        return StreamBuilder(
            // Listen to auth state change
            stream:Supabase.instance.client.auth.onAuthStateChange ,
            builder: (context,snapshot){
                // Loading
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(
                        body: Center(child: CircularProgressIndicator(),),
                    );
                }
                // check if there is a valid session currently
                final session = snapshot.hasData ? snapshot.data!.session : null;

                if(session != null){
                    return HomeScreen();
                } else{
                    return OnboardingScreen();
                }
            },
        );
    }
}