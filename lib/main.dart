import 'package:flutter/material.dart';
import 'package:flutter_food/auth/login_or_register.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:flutter_food/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MainApp()
      ),
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
        child: const MainApp()
      ),
    ],
    child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(), 
      theme: Provider.of<ThemeProvider>(context).themeData,

    );
  }
}
