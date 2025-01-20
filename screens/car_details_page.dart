import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> car = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(car['name']!)),
      body: Column(
        children: [
          Image.asset(car['image']!),
          SizedBox(height: 16),
          Text(car['name']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Price: \$${car['price']}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle booking action
            },
            child: Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
