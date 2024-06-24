import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_cart_tile.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(child: 
              ListView.builder(
                itemBuilder: (context, index) { 

                  final cartItem = userCart[index];

                  return MyCartTile(cartItem: cartItem);
                },
                itemCount: userCart.length,
              )
            )
          ],
        ),
      );
    }, 
    
    );
  }
}