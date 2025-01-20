import 'package:flutter/material.dart';
import 'login_page.dart'; // Replace with the actual file path
import 'signup_page.dart'; // Replace with the actual file path

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Centered Asset (Image/Logo)
            Image.asset(
              'assets/images/logo1.png', // Replace with your asset path
              height: 300, // Adjust height
              width: 300, // Adjust width
            ),
            SizedBox(height: 70), // Spacing between image and text

            // Welcome Text
            Text(
              'Welcome to Your Dream Car App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Spacing between text and buttons

            Text(
              'Your Way to Find Your Car',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), // Spacing between text and buttons


            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10), // Spacing between buttons

            // Signup Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                'Signup',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
