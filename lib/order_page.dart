import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  // Konstruktor untuk menerima data
  OrderPage({required this.name, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath, // Menampilkan gambar yang diteruskan dari halaman sebelumnya
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              name, // Menampilkan nama menu yang diteruskan
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              price, // Menampilkan harga yang diteruskan
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi untuk pesanan (misalnya navigasi atau tindakan lainnya)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Confirm Order",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
