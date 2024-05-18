import 'package:flutter/material.dart';
import 'package:supabase/Screens/IntroScreen.dart';
import 'package:supabase/Theme/theme.dart';
import 'package:supabase/home.dart';
import 'package:supabase/utils/constants.dart';
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
      home: IntroScreen(),

    );
  }
}