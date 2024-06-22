import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_button.dart';
import 'package:flutter_food/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

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
            'Let"s create an account for you', 
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

          MyTextField(controller: passwordController, hintText: "Password", obscureText: true),

          SizedBox(
            height: 10,
          ), 

          MyTextField(controller: confirmPassController, hintText: "Confirm Password", obscureText: true),

          SizedBox(
            height: 10,
          ), 

          MyButton(
            text: "Sign Up",
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
                "alredy have an account?", 
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(
                height: 4,
              ), 

              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login Now", 
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