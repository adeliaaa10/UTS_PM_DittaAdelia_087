import 'package:flutter/material.dart';
import 'product_model.dart'; 

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // 1. Def warna
    final Color backgroundColor = const Color.fromARGB(255, 236, 236, 236);
    final Color redColor = const Color.fromARGB(255, 224, 72, 105); 
    
    return Scaffold(
      backgroundColor: backgroundColor, 
      
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), // Ganti Icon di sini
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          "Detail", 
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
        centerTitle: false, 
      ),
      
  
      body: Column(
        children: [
          // Gambar produk
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain, 
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                  },
                ),
              ),
            ),
          ),
          
          // Teks detail produk
          Container(
            height: 500, 
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              // Membuat sudut kiri kanan atas melengkung
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50, height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300, 
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Nama Produk
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Harga
                Text(
                  product.price,
                  style: TextStyle(
                    fontSize: 24, 
                    color: redColor, 
                    fontWeight: FontWeight.w900
                  ),
                ),
                const SizedBox(height: 20),

                // Label Deskripsi
                const Text(
                  "Deskripsi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                
                // Isi Deskripsi 
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      "Tampil gaya dengan ${product.name}. Dibuat dari bahan berkualitas tinggi yang nyaman dipakai sehari-hari. Cocok untuk melengkapi koleksi fashion Anda. Bahan adem, jahitan rapi, dan tersedia dalam berbagai ukuran.",
                      style: TextStyle(color: Colors.grey.shade600, height: 1.5),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol Pesan 
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                       // Menampilkan notifikasi klik
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("Pesanan ditambahkan ke keranjang!"))
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redColor, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15) 
                      ),
                    ),
                    child: const Text(
                      "Pesan Sekarang",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}