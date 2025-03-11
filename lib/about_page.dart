import 'package:flutter/material.dart';
import 'login_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Happy Food"),
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          // Menambahkan tombol logout di kanan atas
          IconButton(
            icon: Icon(Icons.exit_to_app), // Ikon untuk logout
            onPressed: () {
              // Logic untuk logout, misalnya navigasi ke halaman login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPages();
                  },
                ),
                (route) => false,
              );
              // Arahkan kembali ke halaman login
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(), 
              _teks(),
              _buttoncall(),
              ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(child: Image.asset("assets/login_asset/cs.png")),
      height: 200,
    );
  }

  Widget _buttoncall() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {
            // Add your call logic here
          },
        ),
        Text("Hubungi Kami"),
      ],
    );
  }
}

Widget _teks() {
  return Text(
    "Halaman About\n\n"
    "Pertanyaan Umum (FAQ)\n"
    "Temukan jawaban atas berbagai pertanyaan yang sering ditanyakan oleh pengguna mengenai penggunaan aplikasi ini. Dari proses pendaftaran, cara membeli barang, hingga pengaturan akun, semua jawaban ada di sini untuk mempermudah pengalaman Anda.\n\n"
    "Panduan Penggunaan\n"
    "Pelajari langkah demi langkah cara menggunakan fitur-fitur aplikasi kami. Panduan ini akan membantu Anda memahami bagaimana memaksimalkan penggunaan aplikasi, mulai dari mencari produk hingga menyelesaikan transaksi dengan mudah.\n\n"
    "Kontak Dukungan\n"
    "Jika Anda membutuhkan bantuan lebih lanjut, tim dukungan kami siap membantu. Anda dapat menghubungi kami melalui email, telepon, atau live chat. Kami berkomitmen untuk memberikan solusi terbaik bagi setiap masalah atau pertanyaan yang Anda miliki.",
    textAlign: TextAlign.left,
  );
}