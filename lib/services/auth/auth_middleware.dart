import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMiddleware extends StatelessWidget {
  const AuthMiddleware({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, data) {
          
          // tem dados retornados

          // não tem dados retornados
          
        },
      ),
    );
  }
}