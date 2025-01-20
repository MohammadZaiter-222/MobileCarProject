import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Car>> cars;
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';
  RangeValues _priceRange = RangeValues(0, 100000); // Default price range

  @override
  void initState() {
    super.initState();
    cars = apiService.fetchAllCars(); // Fetch available cars
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Cars'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search by brand or model',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price Range: \$${_priceRange.start.toInt()} - \$${_priceRange.end.toInt()}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: 100000, // Adjust maximum as per your data
                divisions: 20,
                labels: RangeLabels(
                  '\$${_priceRange.start.toInt()}',
                  '\$${_priceRange.end.toInt()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Car>>(
        future: cars,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cars available'));
          } else {
            // Filter cars by search query and price range
            List<Car> filteredCars = snapshot.data!
                .where((car) =>
            car.brand.toLowerCase().contains(_searchQuery) ||
                car.model.toLowerCase().contains(_searchQuery))
                .where((car) =>
            car.price >= _priceRange.start &&
                car.price <= _priceRange.end)
                .toList();

            if (filteredCars.isEmpty) {
              return Center(child: Text('No matching cars found'));
            }

            return ListView.builder(
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                Car car = filteredCars[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.directions_car),
                    title: Text('${car.brand} ${car.model}'),
                    subtitle: Text(
                        'Price: \$${car.price}\nAvailable: ${car.availability ? "Yes" : "No"}'),
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
