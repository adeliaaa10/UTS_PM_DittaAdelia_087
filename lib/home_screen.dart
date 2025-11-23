import 'package:flutter/material.dart';
import 'product_list_screen.dart';
import 'product_detail_screen.dart'; 
import 'product_model.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Variabel Warna
  final Color red = const Color.fromARGB(255, 224, 72, 105);

  // Data produk populer
  List<Product> _getPopularProducts() {
    return [
      Product(name: "Kemeja Pria Hitam", price: "Rp 150.000", imagePath: "images/kemeja6.png", category: "Kemeja"),
      Product(name: "Kaos Polo", price: "Rp 65.000", imagePath: "images/kaos4.png", category: "Kaos"),
      Product(name: "Jaket Denim Cream", price: "Rp 250.000", imagePath: "images/jaket1.png", category: "Jaket"),
      Product(name: "Kemeja Lengan Panjang", price: "Rp 120.000", imagePath: "images/kemeja2.png", category: "Kemeja"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final popularProducts = _getPopularProducts();


    return Scaffold(
      backgroundColor: Colors.white,
      
      // Appbar
      appBar: AppBar(
        backgroundColor: red, 
        elevation: 0, 
        title: const Text(
          "MyShop Mini", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        actions: const [], 
      ),
      
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            // Banner selamat datang
            Container(
              width: double.infinity, // Lebar penuh
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: red, 
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  const Text("Halo, Selamat Datang!", style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 8), 
                  const Text("Toko Baju\nDiskon 50% Hari Ini", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.2)),
                  const SizedBox(height: 15), 
                ],
              ),
            ),

            const SizedBox(height: 25), // Jarak spasi
            // Judul kategori
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Kategori Pilihan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 15), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Jarak antar ikon merata
                children: [
                  _buildImageCategory(context, "Kemeja", "images/icon_kemeja.png"),
                  _buildImageCategory(context, "Kaos", "images/icon_kaos.png"),
                  _buildImageCategory(context, "Jaket", "images/icon_jaket.png"),
                ],
              ),
            ),

            const SizedBox(height: 30), 

            // Judul populer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Produk Populer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            // Grid produk populer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 Kolom
                  childAspectRatio: 0.7, 
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  final product = popularProducts[index];
                  // Memanggil helper widget kartu produk
                  return _buildProductCard(context, product);
                },
              ),
            ),
            
            const SizedBox(height: 30), 
          ],
        ),
      ),
    );
  }

  // Widget kartu produk
  Widget _buildProductCard(BuildContext context, Product product) {
    // GestureDetector: Agar kartu bisa diklik/tap
    return GestureDetector(
      onTap: () {
        // Navigator pindah halaman detail
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
  
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300, 
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded: Gambar mengisi sisa ruang di atas teks
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50, 
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori 
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(30, 224, 72, 105), 
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product.category, 
                      style: TextStyle(
                        fontSize: 10, 
                        color: red, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 5),
                  
                  // Nama Produk
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  // Harga
                  Text(
                    product.price,
                    style: TextStyle(
                      color: red, 
                      fontWeight: FontWeight.w900,
                      fontSize: 14
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget ikon kategori 
  Widget _buildImageCategory(BuildContext context, String label, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(categoryName: label)));
      },
      child: Column(
        children: [
          Container(
            height: 70, width: 70,
            padding: const EdgeInsets.all(15), 
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, spreadRadius: 2, offset: const Offset(0, 5))],
            ),
            child: Image.asset(
              imagePath, fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10), 
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}