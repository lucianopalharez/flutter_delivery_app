import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_quantity_selector.dart';
import 'package:flutter_food/models/cart_item.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCartTile extends StatelessWidget {
  CartItem cartItem;

  MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 100,
                    width: 100,
                  )
                ),

                SizedBox(
                  height: 10,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name),

                    Text('R\$ ' + cartItem.food.price.toString())
                  ],
                ),

                MyQuantitySelector(
                  quantity: cartItem.quantity, 
                  food: cartItem.food, 
                  onIncrement: () {
                    restaurant.addToCart(cartItem.food, cartItem.selectedAddons);                    
                  }, 
                  onDecrement: () {
                    restaurant.removeFromCart(cartItem);
                  }, 
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}