import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String category;

  Product(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.category});
}
