import 'package:flutter/material.dart';
import 'package:grodeals/models/grocery_item.dart';
import 'package:grodeals/providers/suggestedproduct.dart';

class ListItem {
  final String title;
  final String id;
  final int quantity;
  final bool available;
  final String category;
  ListItem(
      {required this.title,
      required this.id,
      required this.quantity,
      required this.available,
      required this.category});
}

class ListProvider with ChangeNotifier {
  final Map<String, ListItem> _items = {
    "prd1": ListItem(
        title: "Ceramont (der Sahnige)",
        id: "prd1",
        quantity: 1,
        available: true,
        category: "Soft cheese"),
    "prd2": ListItem(
        title: "Körniger Frischkäse (Ja)",
        id: "prd2",
        quantity: 1,
        available: true,
        category: "Soft cheese"),
  };

  Map<String, ListItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  String getCategory(String id) {
    if (_items.containsKey(id)) {
      return _items[id]!.category;
    } else {
      return "";
    }
  }

  void incQuantity(String key) {
    if (_items.containsKey(key)) {
      _items.update(
          key,
          (existingListItem) => ListItem(
              title: existingListItem.title,
              id: existingListItem.id,
              quantity: existingListItem.quantity + 1,
              available: true,
              category: existingListItem.category));
    }
    notifyListeners();
  }

  void decQuantity(String key) {
    if (_items.containsKey(key)) {
      _items.update(
          key,
          (existingListItem) => ListItem(
              title: existingListItem.title,
              id: existingListItem.id,
              quantity: existingListItem.quantity - 1,
              available: true,
              category: existingListItem.category));
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
            available: true,
            category: product.category));
    notifyListeners();
  }

  void addItemToList(GroceryItem item) {
    _items.putIfAbsent(
        item.id,
        () => ListItem(
            title: item.name,
            id: item.id,
            quantity: 1,
            available: true,
            category: item.category));
    notifyListeners();
  }
}
