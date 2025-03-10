import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan sudah mengimpor halaman HomePage

class OrderPage extends StatefulWidget {
  final String name;
  final String price;
  final String imagePath;
  final int quantity;

  // Konstruktor untuk menerima data
  OrderPage({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.quantity,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Menghitung harga total berdasarkan jumlah pesanan
  double get totalPrice {
    double unitPrice = double.parse(widget.price.replaceAll('\$', '')); // Mengubah harga ke format angka
    return unitPrice * widget.quantity; // Menggunakan quantity yang diteruskan dari halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomInset: true, // Menyesuaikan ukuran layar saat keyboard muncul
      body: SingleChildScrollView( // Membungkus seluruh isi body dengan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan gambar produk
              Image.asset(
                widget.imagePath, // Menampilkan gambar yang diteruskan dari halaman sebelumnya
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              // Menampilkan nama produk
              Text(
                widget.name, // Menampilkan nama menu yang diteruskan
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Menampilkan harga per unit
              Text(
                widget.price, // Menampilkan harga yang diteruskan
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Menampilkan jumlah pesanan
              Text(
                'Quantity: ${widget.quantity}', // Menampilkan jumlah yang diteruskan
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Menampilkan total harga
              Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              SizedBox(height: 20),
              // Tombol konfirmasi pesanan
              ElevatedButton(
                onPressed: () {
                  // Tampilkan pop-up terimakasih dan tombol kembali ke halaman utama
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Terimakasih"),
                        content: Text("Pesanan Anda telah diterima."),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              // Kembali ke halaman HomePage
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text("Kembali ke Menu Utama"),
                          ),
                        ],
                      );
                    },
                  );
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
      ),
    );
  }
}
