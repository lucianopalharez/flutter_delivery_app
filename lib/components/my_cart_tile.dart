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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary, 
          borderRadius: BorderRadius.circular(8)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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

                  const Spacer(),
              
                  MyQuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onIncrement: () {
                      restaurant.addToCart(cartItem.food, cartItem.selectedAddons);                    
                    }, 
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    }, 
                  ),

                ],
              ),
            ),

            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons.map(
                  (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Row(
                        children: [
                          Text(addon.name), 
                    
                          Text('R\$ ' + addon.price.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary
                            )
                          )
                        ],
                      ), 
                      onSelected: (value) {
                        
                      },
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary  
                        )
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12
                      ),
                    ),
                  )
                ).toList(),
              ),
            ),


          ],
        ),
      ),
    );
  }
}