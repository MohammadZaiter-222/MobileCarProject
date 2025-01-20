import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/api_service.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Car>> cars;

  @override
  void initState() {
    super.initState();
    cars = apiService.fetchAllCars(); // Load all cars for admin
  }

  void showAddCarDialog() {
    final TextEditingController brandController = TextEditingController();
    final TextEditingController modelController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    bool availability = true;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Add New Car'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: brandController,
                    decoration: InputDecoration(labelText: 'Brand'),
                  ),
                  TextField(
                    controller: modelController,
                    decoration: InputDecoration(labelText: 'Model'),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    children: [
                      Text('Available'),
                      Switch(
                        value: availability,
                        onChanged: (value) {
                          setState(() {
                            availability = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (brandController.text.isEmpty ||
                        modelController.text.isEmpty ||
                        priceController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('All fields are required')),
                      );
                      return;
                    }

                    bool success = await apiService.addCar(
                      brandController.text,
                      modelController.text,
                      double.parse(priceController.text),
                      availability,
                    );

                    if (success) {
                      setState(() {
                        cars = apiService.fetchAllCars();
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Car added successfully')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to add car')),
                      );
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showEditCarDialog(Car car) {
    final TextEditingController brandController =
    TextEditingController(text: car.brand);
    final TextEditingController modelController =
    TextEditingController(text: car.model);
    final TextEditingController priceController =
    TextEditingController(text: car.price.toString());
    bool availability = car.availability;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Edit Car'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: brandController,
                    decoration: InputDecoration(labelText: 'Brand'),
                  ),
                  TextField(
                    controller: modelController,
                    decoration: InputDecoration(labelText: 'Model'),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    children: [
                      Text('Available'),
                      Switch(
                        value: availability,
                        onChanged: (value) {
                          setState(() {
                            availability = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (brandController.text.isEmpty ||
                        modelController.text.isEmpty ||
                        priceController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('All fields are required')),
                      );
                      return;
                    }

                    Car updatedCar = Car(
                      id: car.id,
                      brand: brandController.text,
                      model: modelController.text,
                      price: double.parse(priceController.text),
                      availability: availability,
                    );

                    bool success = await apiService.editCar(updatedCar);
                    if (success) {
                      setState(() {
                        cars = apiService.fetchAllCars();
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Car updated successfully')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to update car')),
                      );
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void deleteCar(int id) async {
    bool success = await apiService.deleteCar(id);
    if (success) {
      setState(() {
        cars = apiService.fetchAllCars();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Car deleted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete car')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: showAddCarDialog,
          ),
        ],
      ),
      body: FutureBuilder<List<Car>>(
        future: cars,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cars available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Car car = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.directions_car),
                    title: Text('${car.brand} ${car.model}'),
                    subtitle: Text('Price: \$${car.price}\nAvailable: ${car.availability ? "Yes" : "No"}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => showEditCarDialog(car),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteCar(car.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
