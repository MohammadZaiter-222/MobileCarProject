import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddCarScreen extends StatelessWidget {
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool availability = true;
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Brand'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Model'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Available'),
                Switch(
                  value: availability,
                  onChanged: (value) {
                    availability = value;
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                bool success = await apiService.addCar(
                  brandController.text,
                  modelController.text,
                  double.parse(priceController.text),
                  availability,
                );

                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Car added successfully')),
                  );
                  Navigator.pop(context); // Return to previous screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add car')),
                  );
                }
              },
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
