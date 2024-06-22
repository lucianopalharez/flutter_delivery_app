import 'package:flutter_food/models/food.dart';

class Restaurant {
  
  final List<Food> _menu= [
    Food(
      name: "Xtudo", 
      description: "Xtudo completo", 
      imagePath: "lib/images/burgers/burger1.png", 
      price: 21.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "hamburger extra", price: 1.35)
      ]
    ),
    Food(
      name: "Xbacon", 
      description: "Xbacon com bacom", 
      imagePath: "lib/images/burgers/burger2.png", 
      price: 18.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "hamburger extra", price: 1.35),
        Addon(name: "muita cebola", price: 0.10)
      ]
    ),
    Food(
      name: "Salada de alface", 
      description: "Salada de alface", 
      imagePath: "lib/images/salads/salad1.png", 
      price: 6.79, 
      category: FoodCategory.salads, 
      availableAddons: []
    ),
    Food(
      name: "Sonho", 
      description: "Sonho de doce de leite", 
      imagePath: "lib/images/desserts/dessert1.png", 
      price: 10.99, 
      category: FoodCategory.desserts, 
      availableAddons: []
    ),
    Food(
      name: "Pinga com tudo", 
      description: "Pinga com tudo", 
      imagePath: "lib/images/drinks/drink1.png", 
      price: 15.99, 
      category: FoodCategory.drinks, 
      availableAddons: []
    ),
    Food(
      name: "Coxinha", 
      description: "Coxinha de frango", 
      imagePath: "lib/images/sides/side5.png", 
      price: 6.99, 
      category: FoodCategory.sides, 
      availableAddons: []
    ),
  ];

  //getters

  List<Food> get menu => _menu;

  //operations

    // add to cart
    // remove from the cart
    // get total price of cart
    // get total number of items in cart
    // clean the cart

  //helpers

    // generate a receipt
    // format double value into money
    // format list of addons into a string summary
}