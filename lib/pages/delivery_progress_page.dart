import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_receipt.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress..'),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: Column(
        children: [
          MyReceipt()
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(Icons.person)
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mitch Koko',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18, 
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              Text('Driver',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: () {
                    
                  }, 
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: () {
                    
                  }, 
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                ),
              ),

            ],
          ),

          // message button

          //call button
        ],
      ),
    );
  }
}