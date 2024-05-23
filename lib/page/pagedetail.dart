import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  final String cityName;
  final String imagePath;
  final String starsNumber;
  //final String cityDescription;

  PlaceDetailPage({
    required this.cityName,
    required this.imagePath,
    required this.starsNumber,
    //required this.cityDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to $cityName'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(
                      starsNumber,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Espacement supplémentaire
                Text(
                  'Description${cityName} + welcome',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
