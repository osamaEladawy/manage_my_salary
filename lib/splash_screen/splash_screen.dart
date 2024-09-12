import 'package:expense_management/core/classes/responsive_screen.dart';
import 'package:expense_management/core/classes/service.dart';
import 'package:expense_management/views/home_page.dart';
import 'package:expense_management/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const route = 'splash';

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initializeScreen(context);
    return AnimatedSplashScreen(
      splashIconSize: ResponsiveScreen.screen_height,
      splash: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/mizan.png",
              width: double.infinity,
            ),
            const Text(
              'ميزان',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Gulzar',
              ),
            )
          ],
        ),
      ),
      nextScreen: Services.containKey(key: 'email') ? HomePage() : LoginPage(),
      backgroundColor: Colors.black,
      splashTransition: SplashTransition.scaleTransition,
       curve: Curves.easeOutBack,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
