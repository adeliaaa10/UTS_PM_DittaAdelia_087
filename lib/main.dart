// Nama  : Ditta Adelia
// NIM   : 221080200087
// Kelas : 7A1 


import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      // Memanggil file home_screen.dart
      home: const HomeScreen(), 
    );
  }
}