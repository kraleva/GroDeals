import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grodeals/providers/product.dart';

class ListItem {
  final String title;
  final String id;
  final int quantity;

  ListItem({
    required this.title,
    required this.id,
    required this.quantity,
  });
}

class ListProvider with ChangeNotifier {
  final Map<String, ListItem> _items = {};

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
              quantity: existingListItem.quantity + 1));
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
              quantity: existingListItem.quantity - 1));
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
    items.putIfAbsent(
        product.id,
        () => ListItem(
              title: product.title,
              id: product.id,
              quantity: 1,
            ));
    notifyListeners();
  }
}
