import 'package:flutter/material.dart';
import 'package:grodeals/providers/suggestedproduct.dart';

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
  final Map<String, List<Product>> suggestions;

  Supermarket(
      {required this.title,
      required this.id,
      required this.price,
      required this.allAvailable,
      required this.distance,
      required this.availabilityofproducts,
      required this.reducedPricesOfProducts,
      required this.originalPricesOfProducts,
      required this.reducedProduct,
      required this.suggestions});
}

class SupermarketProvider with ChangeNotifier {
  final Map<String, Supermarket> _supermarkets = {
    "sup1": Supermarket(
        title: "Rewe",
        id: "sup1",
        price: 2.99,
        allAvailable: true,
        distance: 4.1,
        availabilityofproducts: {
          "prd1": true,
          "prd2": true,
          "prd3": true,
          "prd4": true,
          "prd5": true,
          "prd6": true,
          "prd7": true,
          "prd8": true,
          "prd9": true,
          "prd10": true,
          "prd11": true,
          "prd12": true
        },
        reducedPricesOfProducts: {
          "prd1": 2.01,
          "prd2": 0.98,
          "prd3": 2.01,
          "prd4": 1.29,
          "prd5": 1.29,
          "prd6": 4.99,
          "prd7": 1.99,
          "prd8": 1.50,
          "prd9": 15.99,
          "prd10": 1.50,
          "prd11": 4.99,
          "prd12": 4.99
        },
        originalPricesOfProducts: {
          "prd1": 2.99,
          "prd2": 1.49,
          "prd3": 2.99,
          "prd4": 1.29,
          "prd5": 1.29,
          "prd6": 4.99,
          "prd7": 2.99,
          "prd8": 1.50,
          "prd9": 15.99,
          "prd10": 2.50,
          "prd11": 4.99,
          "prd12": 4.99
        },
        reducedProduct: {
          "prd1": true,
          "prd2": true,
          "prd3": true,
          "prd4": false,
          "prd5": false,
          "prd6": false,
          "prd7": true,
          "prd8": false,
          "prd9": false,
          "prd10": true,
          "prd11": false,
          "prd12": false
        },
        suggestions: {}),
    "sup2": Supermarket(
        title: "Edeka",
        id: "sup2",
        price: 1.99,
        allAvailable: false,
        distance: 6.1,
        availabilityofproducts: {
          "prd1": true,
          "prd2": false,
          "prd3": true,
          "prd4": true,
          "prd5": true,
          "prd6": true,
          "prd7": true,
          "prd8": true,
          "prd9": true,
          "prd10": true,
          "prd11": true,
          "prd12": true
        },
        reducedPricesOfProducts: {
          "prd1": 1.99,
          "prd2": 0.00,
          "prd3": 2.01,
          "prd4": 1.29,
          "prd5": 1.29,
          "prd6": 4.99,
          "prd7": 2.50,
          "prd8": 1.50,
          "prd9": 15.99,
          "prd10": 1.50,
          "prd11": 4.99,
          "prd12": 4.99
        },
        originalPricesOfProducts: {
          "prd1": 2.99,
          "prd2": 0.00,
          "prd3": 2.99,
          "prd4": 1.29,
          "prd5": 1.29,
          "prd6": 4.99,
          "prd7": 2.99,
          "prd8": 1.50,
          "prd9": 15.99,
          "prd10": 2.50,
          "prd11": 4.99,
          "prd12": 4.99
        },
        reducedProduct: {
          "prd1": true,
          "prd2": false,
          "prd3": true,
          "prd4": false,
          "prd5": false,
          "prd6": false,
          "prd7": true,
          "prd8": false,
          "prd9": false,
          "prd10": true,
          "prd11": false,
          "prd12": false
        },
        suggestions: {
          "prd2": suggestedProducts
        })
  };

  Map<String, Supermarket> get supermarkets {
    return {..._supermarkets};
  }

  int get itemCount {
    return _supermarkets.length;
  }

  double getPrice(String id) {
    if (_supermarkets.keys.contains(id)) {
      return _supermarkets[id]!.price;
    }
    return 0.00;
  }

  double getDistance(String id) {
    if (_supermarkets.keys.contains(id)) {
      return _supermarkets[id]!.distance;
    }
    return 0.00;
  }

  Supermarket? getSupermarket(String id) {
    return _supermarkets[id];
  }

  List<String> getUnavailable(String id) {
    List<String> unavailable = [];
    _supermarkets[id]!.availabilityofproducts.forEach((key, value) {
      if (value == false) {
        unavailable.add(key);
      }
    });
    return unavailable;
  }

  Map<String, bool> getAvailability(String id) {
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

  //returns a list of values, 1st value is minimal price, the second if it is reduced
  List getLowestPriceForProduct(String productid) {
    double? minimalPrice = double.infinity;
    double? nonReducedlPrice = double.infinity;
    bool? reduced = false;
    _supermarkets.forEach((key, value) {
      if (value.reducedPricesOfProducts[productid]! < minimalPrice!) {
        minimalPrice = value.reducedPricesOfProducts[productid];
        nonReducedlPrice = value.originalPricesOfProducts[productid];
        reduced = true;
      }
      if (value.originalPricesOfProducts[productid]! <= minimalPrice!) {
        minimalPrice = value.originalPricesOfProducts[productid];
        reduced = false;
        nonReducedlPrice = minimalPrice;
      }
    });
    return [minimalPrice, reduced, nonReducedlPrice];
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
