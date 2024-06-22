import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login_page.dart';
import 'package:flutter_food/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MainApp()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(onTap: () {
        
      },), 
      theme: Provider.of<ThemeProvider>(context).themeData,

    );
  }
}
