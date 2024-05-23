import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for a city...',
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          Expanded(
            child: searchQuery.isEmpty
                ? const Center(
              child: Text(
                'Start searching for a city...',
                style: TextStyle(fontSize: 20),
              ),
            )
                : SearchResultList(searchQuery: searchQuery),
          ),
        ],
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  final String searchQuery;

  const SearchResultList({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Simulated data for search results
    final List<String> cities = [
      'Paris', 'New York', 'London', 'Tokyo','Majunga','Tanger','Lomé',
      'Marrakech','Casablanca','Fès','Rabat','Essaouira','Agadir','Chefchaouen',
      'Dubai'
    ];
    final List<String> images = [
      'assets/images/explore/paris.jpeg',
      'assets/images/explore/new_york.jpeg',
      'assets/images/explore/london.jpeg',
      'assets/images/explore/tokyo.jpeg',
      'assets/images/explore/Majunga.jpeg',
      'assets/images/explore/Tanger.jpeg',
      'assets/images/explore/lome.jpeg',
      'assets/images/explore/kech.jpeg',
      'assets/images/explore/casa.jpeg',
      'assets/images/explore/fes.jpeg',
      'assets/images/explore/rabat.jpeg',
      'assets/images/explore/essaouira.jpeg',
      'assets/images/explore/agadir.jpeg',
      'assets/images/explore/chefchaouen.jpeg',

    ];
    final List<String> descriptions = [
      'Description for Paris',
      'Description for New York',
      'Description for London',
      'Description for Tokyo',
      'Description for Majunga',
      'Description for Tanger',
      'Description for Lomé',
      'Description for Marrakech',
      'Description for CASABLANCA',
      'Description for FES',
      'Description for RABAT',
      'Description for ESSAOUIRA',
      'Description for AGADIR',
      'Description for CHEFCHAOUEN',
    ];

    // Filter cities based on search query
    final List<String> filteredCities = cities
        .where((city) => city.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        final image = images[cities.indexOf(city)];
        final description = descriptions[cities.indexOf(city)];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            leading: Image.asset(image, fit: BoxFit.cover, width: 50),
            title: Text(city),
            subtitle: Text(description, maxLines: 1, overflow: TextOverflow.ellipsis),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityDetailPage(
                    cityName: city,
                    cityDescription: description,
                    imagePath: image,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CityDetailPage extends StatelessWidget {
  final String cityName;
  final String imagePath;
  final String cityDescription;

  const CityDetailPage({
    required this.cityName,
    required this.imagePath,
    required this.cityDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                cityDescription,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attractions',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(height: 10),
                  _buildAttractionCarousel(),
                  const SizedBox(height: 20),
                  Text(
                    'Hotels',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(height: 10),
                  _buildHotelCarousel(),
                  const SizedBox(height: 20),
                  Text(
                    'Restaurants',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(height: 10),
                  _buildRestaurantCarousel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttractionCarousel() {
    final List<String> attractionNames = [
      'Attraction 1',
      'Attraction 2',
      'Attraction 3'
    ];
    final List<String> attractionImages = [
      'assets/images/friends/dp0.jpg',
      'assets/images/friends/dp1.jpg',
      'assets/images/friends/dp2.jpg',
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: attractionNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                // Handle tap if needed
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(attractionImages[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        attractionNames[index],
                        style: const TextStyle(
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
    );
  }

  Widget _buildHotelCarousel() {
    final List<String> hotelNames = ['Hotel 1', 'Hotel 2', 'Hotel 3'];
    final List<String> hotelImages = [
      'assets/images/saved/saved0.jpg',
      'assets/images/saved/saved1.jpg',
      'assets/images/saved/saved2.jpg',
      'assets/images/saved/saved3.jpg',
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: hotelNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                // Handle tap if needed
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(hotelImages[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        hotelNames[index],
                        style: const TextStyle(
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
    );
  }


  Widget _buildRestaurantCarousel() {
    final restaurantImages = [
      'assets/images/story/cm0.jpeg',
      'assets/images/story/cm1.jpeg',
      'assets/images/story/cm2.jpeg',
      'assets/images/story/cm3.jpeg',
      'assets/images/story/cm3.jpeg',
      'assets/images/story/cm3.jpeg',
      'assets/images/story/cm3.jpeg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: restaurantImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      'Restaurant',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

  void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Explore(),
    );
  }
}
