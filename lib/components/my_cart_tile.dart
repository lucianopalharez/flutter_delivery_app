import 'package:flutter/material.dart';
import 'package:flutter_food/models/cart_item.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCartTile extends StatelessWidget {
  CartItem cartItem;

  MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Container(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(cartItem.food.imagePath),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name),

                    Text('R\$ ' + cartItem.food.price.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}