import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:CityGem/utils/data.dart';
import 'package:CityGem/widgets/DetailPage.dart'; // Assurez-vous d'importer la nouvelle page de détails

class SavedItem extends StatefulWidget {
  @override
  _SavedItemState createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  final double totalDots = 4;
  double currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                Map datar = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(data: datar),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 190.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              opacity: 2,
                              filterQuality: FilterQuality.high,
                              image: AssetImage(datar['saved']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Ionicons.bookmark_outline,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        datar['city'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Ubuntu-Regular',
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        datar['places'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Ubuntu-Regular',
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Iconsax.location,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            datar['location'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Ubuntu-Regular',
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: DotsIndicator(
              dotsCount: totalDots.toInt(),
              position: currentPosition,
              decorator: DotsDecorator(
                activeColor: Colors.red,
                size: Size.square(10.0),
                spacing: EdgeInsets.only(left: 5),
                activeSize: Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
