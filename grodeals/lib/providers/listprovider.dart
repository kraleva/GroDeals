import 'package:flutter/material.dart';
import 'package:grodeals/providers/product.dart';
import 'package:grodeals/providers/supermarkets.dart';

class ListItem {
  final String title;
  final String id;
  final int quantity;
  final bool available;
  ListItem({
    required this.title,
    required this.id,
    required this.quantity,
    required this.available,
  });
}

class ListProvider with ChangeNotifier {
  final Map<String, ListItem> _items = {
    "prd1": ListItem(
        title: "Ceramont (der Sahnige)",
        id: "prd1",
        quantity: 1,
        available: true),
    "prd2": ListItem(
        title: "Körniger Frischkäse (Ja)",
        id: "prd2",
        quantity: 1,
        available: true),
  };

  Map<String, ListItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void incQuantity(String key) {
    if (_items.containsKey(key)) {
      print("Quantity plus");
      _items.update(
          key,
          (existingListItem) => ListItem(
              title: existingListItem.title,
              id: existingListItem.id,
              quantity: existingListItem.quantity + 1,
              available: true));
    }
    notifyListeners();
  }

  void decQuantity(String key) {
    if (_items.containsKey(key)) {
      print("Quantity minus");
      _items.update(
          key,
          (existingListItem) => ListItem(
              title: existingListItem.title,
              id: existingListItem.id,
              quantity: existingListItem.quantity - 1,
              available: true));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items.remove(id);
    }
    notifyListeners();
  }

  void addProductToList(Product product) {
    _items.putIfAbsent(
        product.id,
        () => ListItem(
            title: product.title,
            id: product.id,
            quantity: 1,
            available: true));
    notifyListeners();
  }
}
