import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/models/cart_item.dart';
import 'package:flutter_food/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  
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
  List<CartItem> get cart => _cart;

  //operations

    // user cart 
    final List<CartItem> _cart = [];

    // add to cart
    void addToCart(Food food, List<Addon> selectedAddons) {
      CartItem? cartItem = _cart.firstWhereOrNull((item) {
        //check if the food items are the same
        bool isSameFood = item.food == food;

        // check if the list of selected addons are the same
        bool isSameAddons = 
          ListEquality().equals(item.selectedAddons, selectedAddons);

        return isSameFood && isSameAddons;
      });      
    
       // if item already exists, increase its quantity
      if (cartItem != null) {
        cartItem.quantity++;
      }

      // case not exists same produtct
      else {
        _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
      }

      notifyListeners();
    }

    // remove from the cart
    void removeFromCart(CartItem cartItem) {
      int cartIndex = _cart.indexOf(cartItem);

      if (cartIndex != 1) {
        if (_cart[cartIndex].quantity > 1) {
          _cart[cartIndex].quantity--;
        } else {
          _cart.removeAt(cartIndex);
        }
      }

      notifyListeners();
    }

    // get total price of cart
    double getTotalPrice() {
      double total = 0.0;

      for (CartItem cartItem in _cart) {
        double itemTotal = cartItem.food.price;

        for (Addon addon in cartItem.selectedAddons) {
          itemTotal += addon.price;
        }

        total += itemTotal * cartItem.quantity;
      }

      return total;
    }

    // get total number of items in cart
    int getTotalItemCount() {
      int totalItemCount = 0;

      for (CartItem cartItem in _cart) {
        totalItemCount += cartItem.quantity;
      }

      return totalItemCount;
    }

    // clean the cart
    void clearCart() {
      _cart.clear();
      notifyListeners();
    }

  //helpers

    // generate a receipt
    String displayCartReceipt() {
      final receipt = StringBuffer();
      receipt.writeln("Here's your receipt.");
      receipt.writeln();

      // format the date to include up to seconds only
      String formattedDate = DateFormat('yyy-MM-dd HH:mm:ss').format(DateTime.now());

      receipt.writeln(formattedDate);
      receipt.writeln();
      receipt.writeln('----------------');

      for (final cartItem in _cart) {
        receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
        );

        if (cartItem.selectedAddons.isNotEmpty) {
          receipt.writeln(
            "      Add-ons: ${_formatAddons(cartItem.selectedAddons)}"
          );
        }

        receipt.writeln();
      }

      receipt.writeln('----------------');
      receipt.writeln();
      receipt.writeln("Total Items: ${getTotalItemCount()}");
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

      return receipt.toString();
    }

    // format double value into money
    String _formatPrice(double price) {
      return "\$${price.toStringAsFixed(2)}";
    }

    // format list of addons into a string summary
    String _formatAddons(List<Addon> addons) {
      return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
    }
}