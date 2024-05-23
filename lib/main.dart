import 'package:flutter/material.dart';
import 'package:CityGem/Screens/IntroScreen.dart';
import 'package:CityGem/Theme/theme.dart';
import 'package:CityGem/home.dart';
import 'package:CityGem/utils/constants.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

void main() {



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: Home(),

    );
  }
}