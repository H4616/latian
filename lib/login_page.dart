import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import font_awesome_flutter

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50], // Latar belakang biru muda
        appBar: AppBar(
          centerTitle: true,
          title: Text("Selamat Datang"),
          backgroundColor: const Color(0xFFFFEB3B),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40, // Ukuran tinggi gambar
              width: 40, // Ukuran lebar gambar
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogo(),
                SizedBox(height: 30),
                _usernameField(),
                SizedBox(height: 20),
                _passwordField(),
                SizedBox(height: 30),
                _loginButton(context),
                SizedBox(height: 20),
                _buildSignupLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        child: Image.asset("assets/login_asset/logo.jpg"),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        username = value;
      },
      decoration: InputDecoration(
        hintText: "Username",
        prefixIcon: Icon(Icons.person, color: Colors.green),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(Icons.lock, color: Colors.green),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFEB3B), // Warna hijau untuk tombol login
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          String text = "";
          if (username == "flutter" && password == "flutter123") {
            setState(() {
              text = "Login Success!";
              isLoginSuccess = true;
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pushReplacementNamed(context, '/home');
              });
            });
          } else {
            setState(() {
              text = "Login Failed!";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(
          "Login",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSignupLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
