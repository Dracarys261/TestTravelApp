import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:CityGem/page/pagedetail.dart';
import 'package:CityGem/category/best_place.dart';
import 'package:CityGem/category/favourites.dart';
import 'package:CityGem/category/hotel.dart';
import 'package:CityGem/category/most_visited.dart';
import 'package:CityGem/category/new_added.dart';
import 'package:CityGem/category/restaurant.dart';


class HomePage extends StatelessWidget {
  var category = [
    'Best Places',
    'Most Visited',
    'Favourites',
    'New Added',
    'Hotels',
    'Restaurants'
  ];
  final List<String> cityNames = [
    'Madagascar',
    'La Reunion',
    'Maldive',
    'Morocco',
    'Morocco',
    'Dubai'
  ];

  final List<String> cityNames2 = [
    'Agadir',
    'New York',
    'Barcelona',
    'Egypt',
    'Nigeria',
    'Cameroun',
  ];
  final List<String> starsnumber = [
    '4.5',
    '5',
    '3.5',
    '4.1',
    '3.7',
    '3.1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Container(
                height: 200,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> images = [
                      'assets/images/posts/post1.jpeg',
                      'assets/images/posts/post2.jpeg',
                      'assets/images/posts/post3.jpeg',
                      'assets/images/posts/post4.jpeg',
                      'assets/images/posts/post5.jpeg',
                      'assets/images/posts/post6.jpeg'
                    ];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailPage(
                              cityName: cityNames2[index],
                              imagePath: images[index],
                              starsNumber: starsnumber[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  cityNames[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),


            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    for(int i=0;i<6;i++)
                      InkWell(
                        onTap: () {
                          _navigateToCategoryPage(context, i);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: Text(
                            category[i],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),


            SizedBox(height: 10.0,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                  final List<String> images = [
                    'assets/images/posts/agadir.jpeg',
                    'assets/images/posts/new_york.jpeg',
                    'assets/images/posts/barcelone.jpeg',
                    'assets/images/posts/egypt.jpeg',
                    'assets/images/posts/nigeria.jpeg',
                    'assets/images/posts/cameroun.jpeg'
                  ];
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlaceDetailPage(
                                  cityName: cityNames2[index], // Utilisez cityNames2 pour le nom de la ville
                                  //cityDescription: CityData.cityDescriptions[cityNames2[index]] ?? '', // Utilisez cityNames2 pour accéder à la description
                                  imagePath: images[index],
                                  starsNumber: starsnumber[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.cover,
                                    opacity: 1,
                                  )
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cityNames2[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.more_vert,size: 30,)
                            ],
                          ),
                        ),


                        SizedBox(height: 5,),
                        Row(children: [
                          Icon(Icons.star,
                            color: Colors.yellow.shade600,
                            size: 20,
                          ),
                          Text(starsnumber[index],style: TextStyle(fontWeight: FontWeight.w500),)
                        ],)
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  void _navigateToCategoryPage(BuildContext context, int index) {
    //logique de navigation , j'ai utiliser switch

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BestPlacePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MostVisitedPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavouritesPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewAdded()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Hotels()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Restaurant()),
        );
        break;

    // Hey guys, you can add another category here.....
      default:

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
    }
  }
}
