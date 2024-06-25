import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress..'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyReceipt()
        ],
      ),
    );
  }
}