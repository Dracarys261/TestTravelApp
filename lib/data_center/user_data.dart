import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String phoneNumber;
  String password;

  User({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class UserData {
  List<User> users = [];
  String? loggedInUserEmail; // Ajout de la propriété loggedInUserEmail

  bool addUser(User user) {
    // Check if the username or email already exists
    bool userExists = users.any((u) => u.username == user.username || u.email == user.email);
    if (userExists) {
      return false;
    } else {
      users.add(user);
      return true;
    }
  }

  User getUserByEmail(String email) {
    var user = users.firstWhere((user) => user.email == email, orElse: () => User(
      username: '',
      email: '',
      phoneNumber: '',
      password: '',
    ));
    return user;
  }

  @override
  String toString() {
    return users.map((user) => user.username).toList().toString();
  }
}

final userData = UserData();
