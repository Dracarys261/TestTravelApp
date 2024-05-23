import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _email = 'User@gmail.com';
  String _phoneNumber = '+212786194387';
  String _city = "Your City";
  String _username = "Username";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,

        //param
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.settings,color: Colors.white,),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text('Paramètres'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Change UserName'),
                                content: TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(hintText: 'Your UserName'),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Annuler'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Valider'),
                                    onPressed: () {
                                      setState(() {
                                        _username = _usernameController.text;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Change Username'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          // loading....
                        },
                        child: const Text('Delete Account'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          // loading.....
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  );
                },
              );
            },

          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'), // Photo de couverture
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/story/cm0.jpeg'), // Photo de profil
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt,color: Colors.white,),
                      onPressed: () {
                        // loading....
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      _username, // Nom d'utilisateur
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(

              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Follower',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '(2,1)K',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Saved',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '(10)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Travel point',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '(50)',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),



            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informations Personnelles',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Email: $_email'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Modifier l\'e-mail'),
                              content: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(hintText: 'Nouvel e-mail'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Annuler'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Valider'),
                                  onPressed: () {
                                    setState(() {
                                      _email = _emailController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('WhatsApp Number: $_phoneNumber'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Modifier le numéro de téléphone'),
                              content: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(hintText: 'Nouveau numéro de téléphone'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Annuler'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Valider'),
                                  onPressed: () {
                                    setState(() {
                                      _phoneNumber = _phoneController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('City: $_city'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Modifier la ville'),
                              content: TextField(
                                controller: _cityController,
                                decoration: InputDecoration(hintText: 'Nouvelle ville'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Annuler'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Valider'),
                                  onPressed: () {
                                    setState(() {
                                      _city = _cityController.text;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
