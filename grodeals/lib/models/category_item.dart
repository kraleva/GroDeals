class CategoryItem {
  final int id;
  final String name;
  final String imagePath;

  CategoryItem({required this.id, required this.name, required this.imagePath});
}

var categoryItemsDemo = [
  CategoryItem(
    id: 1,
    name: "Fresh Fruits & Vegetables",
    imagePath: "assets/images/categories_images/fruit.png",
  ),
  CategoryItem(
    id: 2,
    name: "Cooking Oil",
    imagePath: "assets/images/categories_images/oil.png",
  ),
  CategoryItem(
    id: 3,
    name: "Meat & Fish",
    imagePath: "assets/images/categories_images/meat.png",
  ),
  CategoryItem(
    id: 4,
    name: "Bakery & Snacks",
    imagePath: "assets/images/categories_images/bakery.png",
  ),
  CategoryItem(
    id: 5,
    name: "Dairy & Eggs",
    imagePath: "assets/images/categories_images/dairy.png",
  ),
  CategoryItem(
    id: 6,
    name: "Beverages",
    imagePath: "assets/images/categories_images/beverages.png",
  ),
];
