import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_button.dart';
import 'package:flutter_food/components/my_cart_tile.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:flutter_food/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure you awant to clear the cart?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: const Text('Cancel')
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        }, 
                        child: const Text('Yes')
                      ),

                    ],
                  ),
                );
              }, 
              icon: const Icon(Icons.delete)
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                  ? Expanded(child: Center(child: Text('Cart is empty..')))
                  : Expanded(child: 
                    ListView.builder(
                      itemBuilder: (context, index) { 
              
                        final cartItem = userCart[index];
              
                        return MyCartTile(cartItem: cartItem);
                      },
                      itemCount: userCart.length,
                    )
                  ),             
                ],         
              ),
            ),

            MyButton(text: "Go to checkout", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(),));
            },), 

            SizedBox(
              height: 25,
            )
          ],
        ),
      );
    }, 
    
    );
  }
}