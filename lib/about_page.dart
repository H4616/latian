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
                SizedBox(height: 30),
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
    );
  }
}
