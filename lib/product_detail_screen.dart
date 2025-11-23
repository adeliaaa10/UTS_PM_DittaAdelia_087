import 'package:flutter/material.dart';
import 'product_model.dart'; 

class ProductDetailScreen extends StatefulWidget {
  // Menerima data produk dari halaman sebelumnya
  final Product product; 
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // State variabel ukuran yang sedang dipilih 
  String selectedSize = 'M'; 
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    // Definisi Warna
    final Color backgroundColor = const Color.fromARGB(255, 236, 236, 236); 
    final Color redColor = const Color.fromARGB(255, 224, 72, 105); 
    
    return Scaffold(
      backgroundColor: backgroundColor, 
      
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        foregroundColor: Colors.black, // Warna icon
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), 
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman list produk
          },
        ),
        // Judul Halaman
        title: const Text(
          "Detail", 
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
        centerTitle: false, 
      ),
      
      // Menggunakan Column untuk menyusun Gambar dan teks
      body: Column(
        children: [
          
          // Gambar produk
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  widget.product.imagePath, 
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                  },
                ),
              ),
            ),
          ),
          
          // Container informasi
          Container(
            width: double.infinity, 
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30), 
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            
            // Isi Container Informasi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 25), 

                // Nama Produk
                Text(
                  widget.product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                
                const SizedBox(height: 10),

                // Harga Produk 
                Text(
                  widget.product.price,
                  style: TextStyle(
                    fontSize: 18, 
                    color: redColor, 
                    fontWeight: FontWeight.w900 
                  ),
                ),

                const SizedBox(height: 10),

                // Baris Rating
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20), // Bintang Kuning
                    const SizedBox(width: 5),
                    const Text(
                      "4.9", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "(5rb+ terjual)", 
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 14)
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Text(
                  "Pilih Ukuran",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                
                // Row kotak ukuran
                Row(
                  children: sizes.map((size) {
                    // Logika cek ukuran yang di pilih
                    bool isSelected = selectedSize == size;
                    
                    return GestureDetector(
                      onTap: () {
                        // setState: Memberi tahu Flutter ada data berubah -> Refresh tampilan
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: _buildSizeOption(size, isSelected, redColor),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // Label Deskripsi
                const Text(
                  "Deskripsi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: SingleChildScrollView(
                    child: Text(
                      "Tampil gaya dengan ${widget.product.name}. Dibuat dari bahan berkualitas tinggi yang nyaman dipakai sehari-hari. Cocok untuk melengkapi koleksi fashion Anda. Bahan adem, jahitan rapi, dan tersedia dalam berbagai ukuran.",
                      style: TextStyle(color: Colors.grey.shade600, height: 1.5),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity, 
                  height: 55, 
                  child: ElevatedButton(
                    onPressed: () {
                       // Menampilkan pesan notifikasi 
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Pesanan Ukuran $selectedSize ditambahkan!"))
                       );
                    },
                    // Tombol pesan
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15) 
                      ),
                      elevation: 2, 
                    ),
                    child: const Text(
                      "Pesan Sekarang",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white // Teks Putih
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

  // Widget kotak ukuran
  Widget _buildSizeOption(String size, bool isSelected, Color activeColor) {
    return Container(
      margin: const EdgeInsets.only(right: 15), // Jarak antar kotak
      width: 50, 
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? activeColor : Colors.white,
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(
          color: isSelected ? activeColor : Colors.grey.shade300,
          width: 1.5
        ),
        boxShadow: isSelected ? [
           BoxShadow(
             color: const Color.fromARGB(80, 224, 72, 105), 
             blurRadius: 8, 
             offset: const Offset(0, 4)
           )
        ] : [],
      ),
      // Teks Huruf (S/M/L/XL)
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            // Jika dipilih teks Putih, jika tidak Hitam
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}