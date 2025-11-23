// Nama  : Ditta Adelia
// NIM   : 221080200087
// Kelas : 7A1 


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // Memanggil file home_screen.dart
      home: const HomeScreen(), 
    );
  }
}