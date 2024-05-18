import 'package:flutter/material.dart';
import 'package:animated_introduction/animated_introduction.dart';
import 'package:supabase/Screens/login_signin.dart';
import 'package:supabase/Screens/welcome_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<SingleIntroScreen> pages = [
    const SingleIntroScreen(
      title: 'Welcome to CityGem !',
      description: 'Discover destinations, deals, and hidden gems with CityGem',
      imageAsset: 'assets/images/SVG/svg5.png',
    ),
    const SingleIntroScreen(
      title: 'Travel Easily',
      description: 'Your gateway to destinations',
      imageAsset: 'assets/images/SVG/svg4.png',

    ),
    const SingleIntroScreen(
      title: 'Don\'t afraid to be lost',
      description: 'Find all in one place',
      imageAsset: 'assets/images/SVG/svg3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

        ),
        child:AnimatedIntroduction(
          slides: pages,
          indicatorType: IndicatorType.circle,
          onDone: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen())
            );
          },
        ),

      ),

    );
  }
}
