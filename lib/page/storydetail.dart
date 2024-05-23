import 'package:flutter/material.dart';

class StoryDetailPage extends StatelessWidget {
  final String cityName;
  final String imagePath;
  final String starsNumber;

  const StoryDetailPage({
    Key? key,
    required this.cityName,
    required this.imagePath,
    required this.starsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(imagePath),
            Text(
              'Stars: $starsNumber',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


