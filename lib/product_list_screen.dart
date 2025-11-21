import 'package:flutter/material.dart';
import 'product_model.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  // Def Warna Merah 
  final Color red = const Color.fromARGB(255, 224, 72, 105);

  // Data Produk 
  List<Product> _getProducts() {
    if (categoryName == "Kemeja") {
      return [
        Product(name: "Kemeja Lengan Panjang Biru", price: "Rp 120.000", imagePath: "images/kemeja2.png"),
        Product(name: "Kemeja Merah Muda", price: "Rp 85.000", imagePath: "images/kemeja3.png"),
        Product(name: "Kemeja Salur Biru", price: "Rp 150.000", imagePath: "images/kemeja4.png"),
        Product(name: "Blouse Wanita", price: "Rp 95.000", imagePath: "images/kemeja5.png"),
        Product(name: "Kemeja Pria Hitam", price: "Rp 150.000", imagePath: "images/kemeja6.png"),
        Product(name: "Kemeja Army", price: "Rp 95.000", imagePath: "images/kemeja7.png"),
      ];
    } else if (categoryName == "Kaos") {
      return [
        Product(name: "Kos Hitam Abu", price: "Rp 45.000", imagePath: "images/kaos1.png"),
        Product(name: "Salur Hitam", price: "Rp 55.000", imagePath: "images/kaos2.png"),
        Product(name: "Kaos Hitam Putih", price: "Rp 40.000", imagePath: "images/kaos3.png"),
        Product(name: "Kaos Polo", price: "Rp 65.000", imagePath: "images/kaos4.png"),
        Product(name: "Hitam Hijau", price: "Rp 65.000", imagePath: "images/kaos5.png"),
      ];
    } else { 
      // Jika tidak jaket
      return [
        Product(name: "Jaket Denim Cream", price: "Rp 250.000", imagePath: "images/jaket1.png"),
        Product(name: "Hoodie Polos", price: "Rp 175.000", imagePath: "images/jaket2.png"),
        Product(name: "Jaket Bomber", price: "Rp 220.000", imagePath: "images/jaket3.png"),
        Product(name: "Sweater Abu", price: "Rp 135.000", imagePath: "images/jaket4.png"),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = _getProducts();

    return Scaffold(
      // Background Halaman Putih
      backgroundColor: Colors.white, 
      
      // App bar
      appBar: AppBar(
        backgroundColor: red, // Warna Merah
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          categoryName, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(15.0), // Jarak pinggir halaman
        
        // Menampilkan produk grid
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom 2
            childAspectRatio: 0.7, 
            crossAxisSpacing: 15, // Jarak horizontal 
            mainAxisSpacing: 15, // Jarak vertikal 
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            
            // Tiap produk klik
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail
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
                    
                    // Gambar
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[50], 
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
                            // Penanganan gambar tidak ketemu
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    // Teks bawah gambar
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // Label Kategori 
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(30, 224, 72, 105), 
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              categoryName, 
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
                              fontSize: 14
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