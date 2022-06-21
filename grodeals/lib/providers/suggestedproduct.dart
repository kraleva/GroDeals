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

var suggestedItems = [
  Product(
      title: "Ceramont (der Cremige)",
      id: "prd3",
      category: "Soft cheese",
      imageUrl:
          "https://cdn.ich-liebe-kaese.de/fileadmin/_processed_/2/5/produkt-geramont-cremig-wuerzig-200g_adbbba25f7_csm.png"),
  Product(
      title: "Weichkase (Ja)",
      id: "prd4",
      imageUrl:
          "https://img.rewe-static.de/6980295/2006720_digital-image.png?output-quality=60&fit=inside|840:840&background-color=ffffff",
      category: "Soft cheese"),
  Product(
      title: "Brie (Ja)",
      id: "prd5",
      imageUrl:
          "https://img.rewe-static.de/7156260/23598844_digital-image.png?output-quality=60&fit=inside|840:840&background-color=ffffff",
      category: "Soft cheese"),
];
