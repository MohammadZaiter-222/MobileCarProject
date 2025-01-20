import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';

class ApiService {
  final String baseUrl = "http://localhost/dreamcar/"; // Name of the folder on Htdocs xampp
  // User Signup
  Future<bool> signup(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success']; // Returns true if signup is successful
    } else {
      throw Exception('Failed to sign up');
    }
  }

  // User Login
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Parse the JSON response
    } else {
      throw Exception('Failed to login');
    }
  }

  // Fetch All Cars for Admin
  Future<List<Car>> fetchAllCars() async {
    final response = await http.get(Uri.parse('$baseUrl/get_cars.php'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((car) => Car.fromJson(car)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  // Add Car (Admin Only)
  Future<bool> addCar(String brand, String model, double price, bool availability) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_car.php'),
      body: {
        'brand': brand,
        'model': model,
        'price': price.toString(),
        'availability': availability ? '1' : '0',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else {
      throw Exception('Failed to add car');
    }
  }

  // Edit Car (Admin Only)
  Future<bool> editCar(Car car) async {
    final response = await http.post(
      Uri.parse('$baseUrl/edit_car.php'),
      body: {
        'id': car.id.toString(),
        'brand': car.brand,
        'model': car.model,
        'price': car.price.toString(),
        'availability': car.availability ? '1' : '0',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else {
      throw Exception('Failed to edit car');
    }
  }

  // Delete Car (Admin Only)
  Future<bool> deleteCar(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete_car.php'),
      body: {
        'id': id.toString(),
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else {
      throw Exception('Failed to delete car');
    }
  }

  // Toggle Car Availability (Admin Only)
  Future<bool> toggleAvailability(int id, bool currentAvailability) async {
    final response = await http.post(
      Uri.parse('$baseUrl/toggle_availability.php'),
      body: {
        'id': id.toString(),
        'availability': currentAvailability ? '1' : '0',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'];
    } else {
      throw Exception('Failed to toggle availability');
    }
  }
}
