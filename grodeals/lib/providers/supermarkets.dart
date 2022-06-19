import 'package:flutter/material.dart';

class Supermarket {
  final String title;
  final String id;
  final double price;
  final bool allAvailable;
  final double distance;
  final Map<String, bool> availabilityofproducts;
  final Map<String, double> reducedPricesOfProducts;
  final Map<String, double> originalPricesOfProducts;
  final Map<String, bool> reducedProduct;

  Supermarket(
      {required this.title,
      required this.id,
      required this.price,
      required this.allAvailable,
      required this.distance,
      required this.availabilityofproducts,
      required this.reducedPricesOfProducts,
      required this.originalPricesOfProducts,
      required this.reducedProduct});
}

class SupermarketProvider with ChangeNotifier {
  final Map<String, Supermarket> _supermarkets = {
    "sup1": Supermarket(
      title: "Rewe",
      id: "sup1",
      price: 2.99,
      allAvailable: true,
      distance: 4.1,
      availabilityofproducts: {"prd1": true, "prd2": true},
      reducedPricesOfProducts: {"prd1": 2.01, "prd2": 0.98},
      originalPricesOfProducts: {"prd1": 2.99, "prd2": 1.49},
      reducedProduct: {"prd1": true, "prd2": true},
    ),
    "sup2": Supermarket(
        title: "Edeka",
        id: "sup2",
        price: 1.99,
        allAvailable: false,
        distance: 6.1,
        availabilityofproducts: {"prd1": true, "prd2": false},
        reducedPricesOfProducts: {"prd1": 1.99, "prd2": 0.00},
        originalPricesOfProducts: {"prd1": 2.99, "prd2": 0.00},
        reducedProduct: {"prd1": true, "prd2": false})
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

  Map<String, double> getReducedPrices(String id) {
    if (_supermarkets.keys.contains(id)) {
      return _supermarkets[id]!.reducedPricesOfProducts;
    }
    return {};
  }

  Map<String, String> getPricesAsText(String id, bool reduced) {
    Map<String, String> pricesAsText = {};
    if (_supermarkets.keys.contains(id)) {
      if (reduced) {
        _supermarkets[id]!.reducedPricesOfProducts.forEach((key, value) {
          if (value > 0) {
            pricesAsText[key] = value.toString();
          } else {
            pricesAsText[key] = "";
          }
        });
      } else {
        _supermarkets[id]!.originalPricesOfProducts.forEach((key, value) {
          if (value > 0) {
            pricesAsText[key] = value.toString();
          } else {
            pricesAsText[key] = "";
          }
        });
      }
    }
    return pricesAsText;
  }
}
