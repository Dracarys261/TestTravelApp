import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatelessWidget {
  final Map data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['city']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(data['saved']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              data['city'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              data['places'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Iconsax.location),
                SizedBox(width: 4),
                Text(data['location']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
