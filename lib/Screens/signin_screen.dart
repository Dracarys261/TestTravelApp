import 'package:CityGem/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:CityGem/screens/signup_screen.dart';
import 'package:CityGem/widgets/custom_scaffold.dart';
import 'package:CityGem/data_center/user_data.dart';
import 'package:collection/collection.dart';
import 'package:CityGem/home.dart';

import '../theme/theme.dart';
const kolor = Color(0xFF0FEFD4);

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool rememberPassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(
        children: [
        const Expanded(
        flex: 1,
        child: SizedBox(
        height: 10,
       ),
    ),
    Expanded(
        flex: 7,
        child: Container(
        padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
        decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
        ),
      ),
    child: SingleChildScrollView(
    child: Form(
    key: _formSignInKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text(
    'Welcome back',
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
    color: lightColorScheme.primary,
    ),
    ),
    const SizedBox(
    height: 40.0,
    ),
    TextFormField(
    controller: _emailController,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter Email';
    }
    return null;
    },
    decoration: InputDecoration(
    label: const Text('Email'),
    hintText: 'Enter Email',
    hintStyle: const TextStyle(
    color: Colors.black26,
    ),
    border: OutlineInputBorder(
    borderSide: const BorderSide(
    color: Colors.black12, // Default border color
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
    color: Colors.black12, // Default border color
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    const SizedBox(
    height: 25.0,
    ),
    TextFormField(
    controller: _passwordController,
    obscureText: true,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter Password';
    }
    return null;
    },
    decoration: InputDecoration(
    label: const Text('Password'),
    hintText: 'Enter Password',
    hintStyle: const TextStyle(
    color: Colors.black26,
    ),
    border: OutlineInputBorder(
    borderSide: const BorderSide(
    color: Colors.black12, // Default border color
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
    color: Colors.black12, // Default border color
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    const SizedBox(
    height: 25.0,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    children: [
    Checkbox(
    value: rememberPassword,
    onChanged: (bool? value) {
    setState(() {
    rememberPassword = value!;
    });
    },
    activeColor: lightColorScheme.primary,
    ),
    const Text(
    'Remember me',
    style: TextStyle(
    color: Colors.black45,
    ),
    ),
    ],
    ),
    GestureDetector(
    child: Text(
    'Forget password?',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: lightColorScheme.primary,
    ),
    ),
    ),
    ],
    ),
    const SizedBox(
    height: 25.0,
    ),
    // signup button
    SizedBox(
    width: double.infinity,
    child: ElevatedButton(
    onPressed: () {
    // Récupérer les valeurs saisies
    String email = _emailController.text;
    String password = _passwordController.text;

    // Vérifier si les identifiants correspondent à un utilisateur existant
    bool userExists = userData.users.any((user) => user.email == email && user.password == password);

    if (userExists) {
    //
      // Identifiants valides, afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User authenticated successfully!'),
        ),
      );
      // Naviguer vers la page d'accueil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(), // Remplacez HomePage par le nom de votre page d'accueil
        ),
      );
    } else {
      // Identifiants invalides, afficher un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password!')),
      );
    }
    },
      child: const Text('Sign in'),
    ),
    ),

      const SizedBox(
        height: 25.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 0.7,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: Text(
              'Sign up with',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.7,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 25.0,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.facebook),
          Icon(Icons.g_mobiledata),
          Icon(Icons.apple),
        ],
      ),
      const SizedBox(
        height: 25.0,
      ),
      // don't have an account
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (e) => const SignUpScreen(),
                ),
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: lightColorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20.0,
      ),
    ],
    ),
    ),
    ),
    ),
    ),
        ],
        ),
    );
  }
}

