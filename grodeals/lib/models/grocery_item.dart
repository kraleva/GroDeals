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
      description: "7pcs, Price",
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
      imagePath: "assets/images/beverages_images/pepsi.png")];

var fruitAndVegetables = [
  GroceryItem(
      id: "prd13",
      name: "Apples 500 grams",
      description: "355ml, Price",
      price: 1.99,
      category: "Vegetables",
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: "prd14",
      name: "Bananas 500 grams",
      description: "500 grams, Price",
      price: 2.99,
      category: "Vegetables",
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: "prd15",
      name: "Ginger",
      description: "500 grams",
      price: 0.99,
      category: "Vegetables",
      imagePath: "assets/images/grocery_images/ginger.png"),
  ];


var cookingOil = [
  GroceryItem(
      id: "prd16",
      name: "Olive Oil",
      description: "500 ml, Price",
      price: 6.99,
      category: "Oil",
      imagePath: "assets/images/grocery_images/oliveOil.png"),
  GroceryItem(
      id: "prd17",
      name: "Olive Oil",
      description: "500ml, Price",
      price: 1.50,
      category: "Oil",
      imagePath: "assets/images/grocery_images/oliveOil2.png"),
  GroceryItem(
      id: "prd18",
      name: "Sun FLower Oil",
      description: "500 ml, Price",
      price: 15.99,
      category: "Oil",
      imagePath: "assets/images/grocery_images/sunFlowerOil.png"),
  GroceryItem(
      id: "prd19",
      name: "Coco Oil",
      description: "500 ml, Price",
      price: 1.50,
      category: "Coco Oil",
      imagePath: "assets/images/grocery_images/cocoOil.png"),
  ];


var meatAndFish = [
  GroceryItem(
      id: "prd20",
      name: "Beef",
      description: "500 grams, Price",
      price: 6.99,
      category: "beef",
      imagePath: "assets/images/grocery_images/beef.png"),
  GroceryItem(
      id: "prd21",
      name: "Chicken",
      description: "500 grams, Price",
      price: 1.50,
      category: "Chicken",
      imagePath: "assets/images/grocery_images/chicken.png"),
  GroceryItem(
      id: "prd22",
      name: "Minced Meat",
      description: "500 grams, Price",
      price: 1.50,
      category: "Minced Meat",
      imagePath: "assets/images/grocery_images/meat/mincedMeat.png"),
  GroceryItem(
      id: "prd22",
      name: "Burger",
      description: "500 grams, Price",
      price: 1.50,
      category: "Burger",
      imagePath: "assets/images/grocery_images/burger.png"),

];


var bakery = [
  GroceryItem(
      id: "prd23",
      name: "Bread",
      description: "500 grams, Price",
      price: 6.99,
      category: "bread",
      imagePath: "assets/images/grocery_images/bread.png"),
  GroceryItem(
      id: "prd24",
      name: "Breadrole",
      description: "5 pieces, Price",
      price: 1.50,
      category: "Bread",
      imagePath: "assets/images/grocery_images/breadrole.png"),
  GroceryItem(
      id: "prd25",
      name: "Burger Bun",
      description: "5 Pieces, Price",
      price: 1.50,
      category: "Bread",
      imagePath: "assets/images/grocery_images/burgerBun.png"),
  GroceryItem(
      id: "prd26",
      name: "Toast",
      description: "200 grams, Price",
      price: 1.50,
      category: "bread",
      imagePath: "assets/images/grocery_images/toast.png"),

];

var diaryEggs = [
  GroceryItem(
      id: "prd27",
      name: "Camenbert",
      description: "500 grams, Price",
      price: 6.99,
      category: "cheese",
      imagePath: "assets/images/grocery_images/camenbert.png"),
  GroceryItem(
      id: "prd28",
      name: "Eggs",
      description: "6 pieces, Price",
      price: 1.50,
      category: "Eggs",
      imagePath: "assets/images/grocery_images/eggs.png"),
  GroceryItem(
      id: "prd29",
      name: "Gouda",
      description: "200 grams, Price",
      price: 1.50,
      category: "Bread",
      imagePath: "assets/images/grocery_images/gouda.png"),
  GroceryItem(
      id: "prd30",
      name: "Milk",
      description: "500 ml, Price",
      price: 1.50,
      category: "milk",
      imagePath: "assets/images/grocery_images/milk.png"),
];

