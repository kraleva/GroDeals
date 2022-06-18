import 'package:flutter/material.dart';
import 'package:grodeals/providers/product.dart';
import 'package:grodeals/providers/suggested_supermarkets.dart';

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

class ShoppingList {
  final Map<String, ListItem> list;
  late Supermarket supermarket;

  ShoppingList({
    required this.list,
  });
}

class ListProvider with ChangeNotifier {
  final Map<String, ListItem> _items = {
    "1": ListItem(title: "product1", id: "1", quantity: 1, available: true),
    "2": ListItem(title: "product2", id: "2", quantity: 1, available: true),
  };
  late ShoppingList _shoppingList;

  ListProvider() {
    _shoppingList = ShoppingList(list: _items);
  }

  Map<String, ListItem> get items {
    return {..._shoppingList.list};
  }

  int get itemCount {
    return _shoppingList.list.length;
  }

  void incQuantity(String key) {
    if (_shoppingList.list.containsKey(key)) {
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
      _shoppingList.list.update(
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
      _shoppingList.list.remove(id);
    }
    notifyListeners();
  }

  void addProductToList(Product product) {
    _shoppingList.list.putIfAbsent(
        product.id,
        () => ListItem(
            title: product.title,
            id: product.id,
            quantity: 1,
            available: true));
    notifyListeners();
  }
}
