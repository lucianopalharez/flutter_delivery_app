import 'package:flutter/material.dart';
import 'package:flutter_food/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.food.imagePath),

          Text(widget.food.name),

          Text(widget.food.description),

          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.food.availableAddons.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Addon addon = widget.food.availableAddons[index];

              return CheckboxListTile(
                title: Text(addon.name),
                subtitle: Text('R\$' + addon.price.toString()),
                value: false, 
                onChanged: (value) {

                }
              );
            },
          )
        ],
      ),
    );
  }
}