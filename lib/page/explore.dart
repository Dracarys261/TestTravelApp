import 'package:flutter/material.dart';
class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Explore")),
      body: const Center(
        child: Text('Explore Screen',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
