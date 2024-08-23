import 'package:flutter/material.dart';
import 'package:flutter_food/components/my_button.dart';
import 'package:flutter_food/components/my_textfield.dart';
import 'package:flutter_food/pages/home_page.dart';
import 'package:flutter_food/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {

    // auth service
    final _authService = AuthService();

    // realizar login
    try {
      await _authService.signInUser(
        emailController.text, 
        passwordController.text
      );
    }

    // erro para realizar login
    catch (e) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

  }

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

          MyTextField(controller: passwordController, hintText: "Password", obscureText: true),

          SizedBox(
            height: 10,
          ), 

          MyButton(
            text: "Sign In",
            onTap: signIn,          
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
                onTap: widget.onTap,
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