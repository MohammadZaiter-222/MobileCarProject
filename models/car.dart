class Car {
  final int id;
  final String brand;
  final String model;
  final double price;
  final bool availability;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.availability,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: int.parse(json['id']),
      brand: json['brand'],
      model: json['model'],
      price: double.parse(json['price']),
      availability: json['availability'] == '1', // Convert 1/0 to boolean
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'brand': brand,
      'model': model,
      'price': price.toString(),
      'availability': availability ? '1' : '0',
    };
  }
}
