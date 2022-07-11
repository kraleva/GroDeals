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
          "prd12": true,
          "prd13": true,
          "prd14": true,
          "prd15": true,
          "prd16": true,
          "prd17": true,
          "prd18": true,
          "prd19": true,
          "prd20": true,
          "prd21": true,
          "prd22": true,
          "prd23": true,
          "prd24": true,
          "prd25": true,
          "prd26": true,
          "prd27": true,
          "prd28": true,
          "prd29": true,
          "prd30": true,
          "prd31": true,
          "prd32": true,
          "prd33": true,
          "prd34": true,
          "prd35": true,
          "prd36": true,
          "prd37": true,
          "prd38": true,
          "prd39": true,
          "prd40": true,
        },
        reducedPricesOfProducts: {
          "prd1": 2.01,
          "prd2": 0.98,
          "prd3": 2.01,
          "prd4": 1.29,
          "prd5": 1.29,
          "prd6": 4.99,
          "prd7": 1.99,
          "prd8": 1.40,
          "prd9": 14.99,
          "prd10": 1.50,
          "prd11": 4.99,
          "prd12": 4.99,
          "prd13": 1.99,
          "prd14": 1.99,
          "prd15": 1.99,
          "prd16": 1.99,
          "prd17": 1.99,
          "prd18": 1.99,
          "prd19": 1.99,
          "prd20": 1.99,
          "prd21": 1.99,
          "prd22": 1.99,
          "prd23": 1.99,
          "prd24": 1.99,
          "prd25": 1.99,
          "prd26": 1.99,
          "prd27": 1.99,
          "prd28": 1.99,
          "prd29": 1.99,
          "prd30": 1.99,
          "prd31": 1.99,
          "prd30": 1.99,
          "prd31": 1.99,
          "prd32": 1.99,
          "prd33": 1.99,
          "prd34": 1.99,
          "prd35": 1.99,
          "prd36": 1.99,
          "prd37": 1.99,
          "prd38": 1.99,
          "prd39": 1.99,
          "prd40": 1.99,
          "prd11": 3.99,
          "prd12": 3.99,
          "prd13": 3.99,
          "prd14": 1.49
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
          "prd12": 4.99,
          "prd13": 2.99,
          "prd14": 2.99,
          "prd15": 2.99,
          "prd16": 2.99,
          "prd17": 2.99,
          "prd18": 2.99,
          "prd19": 2.99,
          "prd20": 2.99,
          "prd21": 2.99,
          "prd22": 2.99,
          "prd23": 2.99,
          "prd24": 2.99,
          "prd25": 2.99,
          "prd26": 2.99,
          "prd27": 2.99,
          "prd28": 2.99,
          "prd29": 2.99,
          "prd30": 2.99,
          "prd31": 2.99,
          "prd32": 2.99,
          "prd33": 2.99,
          "prd34": 2.99,
          "prd35": 2.99,
          "prd36": 2.99,
          "prd37": 2.99,
          "prd38": 2.99,
          "prd39": 2.99,
          "prd40": 2.99,
        },
        reducedProduct: {
          "prd1": true,
          "prd2": true,
          "prd3": true,
          "prd4": false,
          "prd5": false,
          "prd6": false,
          "prd7": true,
          "prd8": true,
          "prd9": true,
          "prd10": true,
          "prd11": false,
          "prd12": false,
          "prd13": false,
          "prd14": false,
          "prd15": false,
          "prd16": false,
          "prd17": false,
          "prd18": false,
          "prd19": false,
          "prd20": false,
          "prd21": false,
          "prd22": false,
          "prd23": false,
          "prd24": false,
          "prd25": false,
          "prd26": false,
          "prd27": false,
          "prd28": false,
          "prd29": false,
          "prd30": false,
          "prd31": false,
          "prd32": false,
          "prd33": false,
          "prd34": false,
          "prd35": false,
          "prd36": false,
          "prd37": false,
          "prd38": false,
          "prd39": false,
          "prd40": false,
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
          "prd12": true,
          "prd13": true,
          "prd14": true,
          "prd15": true,
          "prd16": true,
          "prd17": true,
          "prd18": true,
          "prd19": true,
          "prd20": true,
          "prd21": true,
          "prd22": true,
          "prd23": false,
          "prd24": false,
          "prd25": false,
          "prd26": false,
          "prd27": false,
          "prd28": false,
          "prd29": false,
          "prd30": false,
          "prd31": false,
          "prd32": false,
          "prd33": false,
          "prd34": false,
          "prd35": false,
          "prd36": false,
          "prd37": false,
          "prd38": false,
          "prd39": false,
          "prd40": false,
          "prd41": false,
          "prd14": true
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
          "prd12": 4.99,
          "prd13": 4.99,
          "prd14": 4.99,
          "prd14": 4.99,
          "prd15": 4.99,
          "prd16": 4.99,
          "prd17": 4.99,
          "prd18": 4.99,
          "prd19": 4.99,
          "prd20": 4.99,
          "prd21": 4.99,
          "prd22": 4.99,
          "prd23": 4.99,
          "prd24": 4.99,
          "prd25": 4.99,
          "prd26": 4.99,
          "prd27": 4.99,
          "prd28": 4.99,
          "prd29": 4.99,
          "prd30": 4.99,
          "prd31": 4.99,
          "prd32": 4.99,
          "prd33": 4.99,
          "prd34": 4.99,
          "prd35": 4.99,
          "prd36": 4.99,
          "prd37": 4.99,
          "prd38": 4.99,
          "prd39": 4.99,
          "prd40": 4.99,
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
          "prd12": 4.99,
          "prd13": 4.99,
          "prd14": 4.99,
          "prd15": 4.99,
          "prd16": 4.99,
          "prd17": 4.99,
          "prd18": 4.99,
          "prd19": 4.99,
          "prd20": 4.99,
          "prd21": 4.99,
          "prd22": 4.99,
          "prd23": 4.99,
          "prd24": 4.99,
          "prd25": 4.99,
          "prd26": 4.99,
          "prd27": 4.99,
          "prd28": 4.99,
          "prd29": 4.99,
          "prd30": 4.99,
          "prd31": 4.99,
          "prd32": 4.99,
          "prd33": 4.99,
          "prd34": 4.99,
          "prd35": 4.99,
          "prd36": 4.99,
          "prd37": 4.99,
          "prd38": 4.99,
          "prd39": 4.99,
          "prd40": 4.99,
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
          "prd12": false,
          "prd13": false,
          "prd14": false,
          "prd15": false,
          "prd16": false,
          "prd17": false,
          "prd18": false,
          "prd19": false,
          "prd20": false,
          "prd21": false,
          "prd22": false,
          "prd23": false,
          "prd24": false,
          "prd25": false,
          "prd26": false,
          "prd27": false,
          "prd28": false,
          "prd29": false,
          "prd30": false,
          "prd31": false,
          "prd32": false,
          "prd33": false,
          "prd34": false,
          "prd35": false,
          "prd36": false,
          "prd37": false,
          "prd38": false,
          "prd39": false,
          "prd40": false,
          "prd41": false,
          "prd14": false
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

  List<String> getUnavailable(String id, List<String> productids) {
    List<String> unavailable = [];
    _supermarkets[id]!.availabilityofproducts.forEach((key, value) {
      if (value == false) {
        // ignore: unrelated_type_equality_checks
        var contained = productids.where((element) => element == key);
        if (contained.isNotEmpty) {
          unavailable.add(key);
        }
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

  String getLowestPriceForSupermarket(String supermarketid, String productid) {
    if (_supermarkets.keys.contains(supermarketid)) {
      if (_supermarkets[supermarketid]!
          .reducedPricesOfProducts
          .keys
          .contains(productid)) {
        return _supermarkets[supermarketid]!
            .reducedPricesOfProducts[productid]
            .toString();
      }
    }
    return "";
  }
}
