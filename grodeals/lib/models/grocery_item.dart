class GroceryItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String category;

  GroceryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.category,
  });
}

var demoItems = [
  GroceryItem(
      id: "prd1",
      name: "Organic Bananas",
      description: "7pcs, Priceg",
      price: 4.99,
      category: "bananas",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: "prd2",
      name: "Red Apple",
      description: "1kg, Priceg",
      price: 4.99,
      category: "apples",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: "prd3",
      name: "Bell Pepper Red",
      description: "1kg, Priceg",
      price: 4.99,
      category: "pepper",
      imagePath: "assets/images/grocery_images/pepper.png"),
  GroceryItem(
      id: "prd4",
      name: "Ginger",
      description: "250gm, Priceg",
      price: 4.99,
      category: "roots",
      imagePath: "assets/images/grocery_images/ginger.png"),
  GroceryItem(
      id: "prd5",
      name: "Meat",
      description: "250gm, Priceg",
      price: 4.99,
      category: "chicken",
      imagePath: "assets/images/grocery_images/beef.png"),
  GroceryItem(
      id: "prd6",
      name: "Chikken",
      description: "250gm, Priceg",
      price: 4.99,
      category: "chicken",
      imagePath: "assets/images/grocery_images/chicken.png"),
];

var exclusiveOffers = [demoItems[0], demoItems[1]];

var bestSelling = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];

var beverages = [
  GroceryItem(
      id: "prd7",
      name: "Dite Coke",
      description: "355ml, Price",
      price: 1.99,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      id: "prd8",
      name: "Sprite Can",
      description: "325ml, Price",
      price: 1.50,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/sprite.png"),
  GroceryItem(
      id: "prd9",
      name: "Apple Juice",
      description: "2L, Price",
      price: 15.99,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/apple_and_grape_juice.png"),
  GroceryItem(
      id: "prd10",
      name: "Orange Juice",
      description: "2L, Price",
      price: 1.50,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/orange_juice.png"),
  GroceryItem(
      id: "prd11",
      name: "Coca Cola Can",
      description: "325ml, Price",
      price: 4.99,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/coca_cola.png"),
  GroceryItem(
      id: "prd12",
      name: "Pepsi Can",
      description: "330ml, Price",
      price: 4.99,
      category: "cold-bevarages sparkling",
      imagePath: "assets/images/beverages_images/pepsi.png"),
];

var suggestedItems = [
  GroceryItem(
      id: "prd13",
      name: "Ceramont (der Sahnige)",
      description: "cremige Weichkäse",
      price: 1.99,
      category: "soft cheese",
      imagePath: "assets/images/beverages_images/diet_coke.png"),
  GroceryItem(
      id: "prd14",
      name: "Ceramont (der Cremige)",
      description: "cremige Topkäse",
      price: 1.99,
      category: "soft cheese",
      imagePath: "assets/images/beverages_images/sprite.png"),
];
