import 'package:flutter/material.dart';
import 'product_model.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  // Menerima nama kategori yang dikirim dari halaman Home 
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  // Definisi warna
  final Color red = const Color.fromARGB(255, 224, 72, 105);

  // Daftar produk 
  List<Product> _getProducts() {
    if (categoryName == "Kemeja") {
      return [
        Product(name: "Kemeja Lengan Panjang", price: "Rp 120.000", imagePath: "images/kemeja2.png", category: "Kemeja"),
        Product(name: "Kemeja Merah Muda", price: "Rp 85.000", imagePath: "images/kemeja3.png", category: "Kemeja"),
        Product(name: "Kemeja Salur Biru", price: "Rp 150.000", imagePath: "images/kemeja4.png", category: "Kemeja"),
        Product(name: "Blouse Wanita", price: "Rp 95.000", imagePath: "images/kemeja5.png", category: "Kemeja"),
        Product(name: "Kemeja Pria Hitam", price: "Rp 150.000", imagePath: "images/kemeja6.png", category: "Kemeja"),
        Product(name: "Kemeja Army", price: "Rp 95.000", imagePath: "images/kemeja7.png", category: "Kemeja"),
      ];
    } else if (categoryName == "Kaos") {
      return [
        Product(name: "Kos Hitam Abu", price: "Rp 45.000", imagePath: "images/kaos1.png", category: "Kaos"),
        Product(name: "Salur Hitam", price: "Rp 55.000", imagePath: "images/kaos2.png", category: "Kaos"),
        Product(name: "Kaos Hitam Putih", price: "Rp 40.000", imagePath: "images/kaos3.png", category: "Kaos"),
        Product(name: "Kaos Polo", price: "Rp 65.000", imagePath: "images/kaos4.png", category: "Kaos"),
        Product(name: "Hitam Hijau", price: "Rp 65.000", imagePath: "images/kaos5.png", category: "Kaos"),
      ];
    } else { 
      return [
        Product(name: "Jaket Denim Cream", price: "Rp 250.000", imagePath: "images/jaket1.png", category: "Jaket"),
        Product(name: "Hoodie Polos", price: "Rp 175.000", imagePath: "images/jaket2.png", category: "Jaket"),
        Product(name: "Jaket Bomber", price: "Rp 220.000", imagePath: "images/jaket3.png", category: "Jaket"),
        Product(name: "Sweater Abu", price: "Rp 135.000", imagePath: "images/jaket4.png", category: "Jaket"),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = _getProducts();

    return Scaffold(

      backgroundColor: Colors.white, 
      
      // App bar
      appBar: AppBar(
        backgroundColor: red, 
        elevation: 0, 
        // Back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        // Judul Halaman
        title: Text(
          categoryName, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        // GridView daftar produk
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 produk per baris
            childAspectRatio: 0.7, // tinggi
            crossAxisSpacing: 15, // Jarak horizontal 
            mainAxisSpacing: 15, // Jarak vertikal 
          ),
          itemCount: products.length, 
          itemBuilder: (context, index) {
            final product = products[index];
            
            // klik pada kartu produk
            return GestureDetector(
              onTap: () {
                // Ke halaman Detail Produk saat diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              
              // Kartu produk
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
                
                // Colum gambar dan teks produk
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Gambar produk
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50, 
                          // Melengkungkan sudut atas saja
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        // Menampilkan Gambar Aset
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            product.imagePath,
                            fit: BoxFit.contain, 
                            // Jika gambar salah path
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    // Teks produk
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // Label kategori
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
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 16 
                            ),
                            maxLines: 1, 
                            overflow: TextOverflow.ellipsis, 
                          ),
                          
                          const SizedBox(height: 5),
                          
                          // Harga Produk
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
          },
        ),
      ),
    );
  }
}