import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_button.dart';
import 'package:flutter_food/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_open_rounded,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,            
          ), 

          SizedBox(
            height: 25,
          ),

          Text(
            'Food Delivery App', 
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary
            ),
          ), 

          SizedBox(
            height: 25,
          ), 

          MyTextField(controller: emailController, hintText: "Email", obscureText: false),

          SizedBox(
            height: 10,
          ), 

          MyTextField(controller: emailController, hintText: "Password", obscureText: true),

          SizedBox(
            height: 10,
          ), 

          MyButton(
            text: "Sign In",
            onTap: () {
              
            },          
          ), 

          SizedBox(
            height: 25,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?", 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(
                height: 4,
              ), 

              GestureDetector(
                onTap: () {
                  
                },
                child: Text(
                  "Register Now", 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}