/*import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/admin_page.dart';
import 'screens/add_car_screen.dart';

void main() {
  runApp(CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/admin': (context) => AdminScreen(),
        '/addCar': (context) => AddCarScreen(),
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'screens/welcome_page.dart'; // Adjust the file path as needed

void main() {
  runApp(CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(), // Set WelcomePage as the initial page
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'screens/welcome_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/home_page.dart';
import 'screens/admin_page.dart';
import 'screens/add_car_screen.dart';

void main() {
  runApp(CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(), // Start with the Welcome Page
      routes: {
        '/login': (context) => LoginScreen(), // Login page
        '/signup': (context) => SignupScreen(), // Signup page
        '/home': (context) => HomeScreen(), // User home page
        '/admin': (context) => AdminScreen(), // Admin dashboard
        '/addCar': (context) => AddCarScreen(), // Add car page
      },
    );
  }
}
