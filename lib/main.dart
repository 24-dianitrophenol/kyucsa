import 'package:flutter/material.dart';
import 'package:kyucsa/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kyucsa App',
      theme: ThemeData(   
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(

      ), // Set SplashScreen as the initial screen
    );
  }
}
