import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home_page.dart';
import 'package:flutter_food/services/auth/login_or_register.dart';

class AuthMiddleware extends StatelessWidget {
  const AuthMiddleware({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, data) {
          
          // tem dados retornados
          if (data.hasData) {
            return const HomePage();
          }

          // não tem dados retornados
          else {
            return const LoginOrRegister();
          }

        },
      ),
    );
  }
}