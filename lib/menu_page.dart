import 'package:flutter/material.dart';
import 'order_page.dart'; // Pastikan sudah mengimpor halaman OrderPage

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Happy Food"),
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Logic untuk membuka menu samping (drawer)
          },
        ),
        actions: [
          // Menambahkan tombol logout di kanan atas
          IconButton(
            icon: Icon(Icons.exit_to_app), // Ikon untuk logout
            onPressed: () {
              // Logic untuk logout, misalnya navigasi ke halaman login
              Navigator.pushReplacementNamed(
                context,
                '/login',
              ); // Arahkan kembali ke halaman login
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _restaurantMenu(), // Panggil widget menu restoran
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan menu restoran
  Widget _restaurantMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Menu",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 15),
        // Menggunakan ListView untuk menampilkan menu dalam bentuk daftar vertikal
        ListView.builder(
          shrinkWrap:
              true, // Membuat ListView menyesuaikan dengan ruang yang tersedia
          physics:
              NeverScrollableScrollPhysics(), // Menonaktifkan scroll default dari ListView
          itemCount: 6, // Jumlah item menu
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Mengarahkan ke halaman order dan mengirimkan data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => OrderPage(
                          name: "Menu ${index + 1}",
                          price: "\$15.99",
                          quantity: 1, // Mengatur quantity default menjadi 1
                          imagePath:
                              'assets/home_assets/gambar${index + 1}.jpg',
                        ),
                  ),
                );
              },
              child: Card(
                color: Colors.green[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      // Menampilkan gambar item
                      Image.asset(
                        'assets/home_assets/gambar${index + 1}.jpg', // Gambar akan diambil dari direktori home_assets
                        width: 80, // Tentukan lebar gambar jika diperlukan
                        height: 80, // Tentukan tinggi gambar jika diperlukan
                      ),
                      SizedBox(width: 15),
                      // Menampilkan nama dan harga menu
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Menu ${index + 1}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "\$15.99", // Harga menu
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Menambahkan tombol Order di bawah gambar dan teks
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => OrderPage(
                                    name: "Menu ${index + 1}",
                                    price: "\$15.99",
                                    quantity: 1, // Mengirimkan quantity default
                                    imagePath:
                                        'assets/home_assets/gambar${index + 1}.jpg',
                                  ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
