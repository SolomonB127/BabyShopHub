import 'package:baby_shop_hub/data/services/auth_service.dart';
import 'package:baby_shop_hub/presentation/screens/auth/login_screen.dart';
import 'package:baby_shop_hub/presentation/widgets/specific/layout.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/custom_tile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // get auth service
  final authService = AuthService();


  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Toggle for password visibility
  bool isOpen = true;

  void showPassword() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void _signUp() async{
    // prepare data
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // check password match
    if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password mismatch. Try Again!!",style: TextStyle(color: AppColors.error))));
        return;
    }

    // attempt signup...
    try {
      await authService.signUpWithEmailPassword(email, password);

      if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Layout()));
        }

      // pop page after successful signup
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } 
    // catch any errors...
    catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e",style: TextStyle(color: AppColors.error),)));
      } else {
        
      }
    }
  }

  /// Builds the social sign-in icons using a Wrap for responsiveness.
  Widget _buildSocialIcons() {
    final List<Map<String, dynamic>> socialIcons = [
      {
        "path": "../../../../assets/icon/google_icon.png",
        "onTap": () {
          // TODO: Add Google sign in logic
        },
      },
      {
        "path": "../../../../assets/icon/apple_icon.png",
        "onTap": () {
          // TODO: Add Apple sign in logic
        },
      },
      {
        "path": "../../../../assets/icon/x_icon.png",
        "onTap": () {
          // TODO: Add X sign in logic
        },
      },
      {
        "path": "../../../../assets/icon/facebook_icon.png",
        "onTap": () {
          // TODO: Add Facebook sign in logic
        },
      },
      {
        "path": "../../../../assets/icon/instagram_icon.png",
        "onTap": () {
          // TODO: Add Instagram sign in logic
        },
      },
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 10,
      children: socialIcons.map((social) {
        return CustomTile(
          imgPath: social["path"],
          onTap: social["onTap"],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                // App logo
                Image.asset(
                  "../../../../assets/images/sign-up.png",
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 25),
                // Email text field
                Textfields(
                  controller: emailController,
                  labelText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                // Password text field with visibility toggle
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Textfields(
                      controller: passwordController,
                      labelText: "Password",
                      obscureText: isOpen,
                    ),
                    Positioned(
                      right: 20,
                      child: IconButton(
                        onPressed: showPassword,
                        icon: Icon(
                          isOpen ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Textfields(
                      controller: confirmPasswordController,
                      labelText: "Confirm Password",
                      obscureText: isOpen,
                    ),
                    Positioned(
                      right: 20,
                      child: IconButton(
                        onPressed: showPassword,
                        icon: Icon(
                          isOpen ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Forgot password link
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.textHint,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Sign In button
                CustomButton(
                  onTap: _signUp,
                  text: "Sign Up",
                ),
                const SizedBox(height: 20),
                // Divider with "or continue with"
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.divider,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "or continue with",
                        style: TextStyle(
                          color: AppColors.textHint,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.divider,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Social sign-in options
                _buildSocialIcons(),
                const SizedBox(height: 10),
                // Register navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                      child: const Text(
                        "Sign In.",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
