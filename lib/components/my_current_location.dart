import 'package:flutter/material.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {

    TextEditingController addressController = TextEditingController();

    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('Your Location'),
      content: TextField(
        controller: addressController,
        decoration: const InputDecoration(
          hintText: "Search address.."
        ),
      ), 
      actions: [
        MaterialButton(onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        MaterialButton(onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now", 
            style: TextStyle(color: Theme.of(context).colorScheme.primary) 
          ), 
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => 
                    Text(restaurant.deliveryAddress,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold
                      )
                    ),
                ),
                
                  
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}