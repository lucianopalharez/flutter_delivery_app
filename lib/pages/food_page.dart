import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_button.dart';
import 'package:flutter_food/models/food.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    //close the current food page go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentySelectedAddons = [];

    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurant>().addToCart(food, currentySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.food.imagePath, width: double.infinity,fit: BoxFit.cover,),
            
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [             
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
            
                      Text(
                        'R\$ ' + widget.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
            
                      SizedBox(
                        height: 10,
                      ),
                  
                      Text(
                        widget.food.description,
                      ),
            
                      SizedBox(
                        height: 10,
                      ),
            
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
            
                      SizedBox(
                        height: 10,
                      ),
            
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
            
                      SizedBox(
                        height: 10,
                      ),
                  
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            Addon addon = widget.food.availableAddons[index];
                                    
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                'R\$ ' + addon.price.toString(),
                                style: TextStyle( 
                                  color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              value: widget.selectedAddons[addon], 
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon]
                                  = value!;                            
                                });
                              }
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
            
                MyButton(text: "Add to cart", onTap: () =>
                  addToCart(widget.food, widget.selectedAddons)
                ),
        
                SizedBox(
                  height: 25,
                ),
        
        
        
              ],
            ),
          ),
        ),

        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,              
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}