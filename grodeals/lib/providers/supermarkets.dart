import 'package:flutter/material.dart';

class Supermarket {
  final String title;
  final String id;
  final double price;
  final bool allAvailable;
  final double distance;
  final Map<String, bool> availabilityofproducts;

  Supermarket(
      {required this.title,
      required this.id,
      required this.price,
      required this.allAvailable,
      required this.distance,
      required this.availabilityofproducts});
}

class SupermarketProvider with ChangeNotifier {
  final Map<String, Supermarket> _supermarkets = {
    "sup1": Supermarket(
        title: "Rewe",
        id: "sup1",
        price: 2.99,
        allAvailable: true,
        distance: 4.1,
        availabilityofproducts: {"prd1": true, "prd2": true}),
    "sup2": Supermarket(
        title: "Edeka",
        id: "sup2",
        price: 1.99,
        allAvailable: false,
        distance: 6.1,
        availabilityofproducts: {"prd1": true, "prd2": false}),
  };

  Map<String, Supermarket> get supermarkets {
    return {..._supermarkets};
  }

  int get itemCount {
    return _supermarkets.length;
  }

  Map<String, bool> getAvailability(String id) {
    print(id);
    if (_supermarkets.keys.contains(id)) {
      return _supermarkets[id]!.availabilityofproducts;
    }
    return {};
  }
}
