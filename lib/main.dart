import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/auth/login_or_register.dart';
import 'package:flutter_food/firebase_options.dart';
import 'package:flutter_food/models/restaurant.dart';
import 'package:flutter_food/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
