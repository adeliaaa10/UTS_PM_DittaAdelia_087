import 'package:flutter/material.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Def warna utama aplikasi
  final Color red = const Color.fromARGB(255, 224, 72, 105);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // App bar
      appBar: AppBar(
        backgroundColor: red, 
        elevation: 0, 
        title: const Text(
          "MyShop Mini", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        actions: const [], 
      ),
      
      // Isi halaman
      body: Column(
        children: [
          
          // Banner selamat datang
          Container(
            width: double.infinity, 
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: red, 
              // Membuat sudut bawah melengkung
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
              children: [
                const Text(
                  "Halo, Selamat Datang!",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8), 
                const Text(
                  "Toko Baju\nDiskon 50% Hari Ini",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 15), 
              ],
            ),
          ),

          const SizedBox(height: 25), 

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Jarak antar elemen 
              children: const [
                Text(
                  "Kategori Pilihan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15), 

        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // Row kategori
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Memanggil widget kategori
                _buildImageCategory(
                  context, 
                  "Kemeja", 
                  "images/icon_kemeja.png" 
                ),
                _buildImageCategory(
                  context, 
                  "Kaos", 
                  "images/icon_kaos.png" 
                ),
                _buildImageCategory(
                  context, 
                  "Jaket", 
                  "images/icon_jaket.png" 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget kategori
  Widget _buildImageCategory(BuildContext context, String label, String imagePath) {
    return InkWell(
      onTap: () {
        // Pindah halaman kategori
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(categoryName: label),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(15), 
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200, // Warna bayangan
                  blurRadius: 10, 
                  spreadRadius: 2, 
                  offset: const Offset(0, 5), 
                ),
              ],
            ),
          
            child: Image.asset(
              imagePath, 
              fit: BoxFit.contain, 
              // Cadangan  gambar error
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(height: 10), // 
          // Text nama kategori di bawah kotak
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize: 14, 
              color: Colors.black87
            ),
          ),
        ],
      ),
    );
  }
}