import 'package:flutter/material.dart';
import 'package:latian_praktikum/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = false;
  double _containerHeight = 200;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    // Delay untuk memulai animasi setelah halaman ditampilkan
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
        _containerHeight = 500;
        _opacity = 0.8;
      });
    });
  }

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
        // Membungkus dengan SingleChildScrollView untuk scroll
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeText(),

              // Menu Restoran dengan Animasi
              SizedBox(height: 25),
              _restaurantMenu(),

              // Tawaran Spesial
              SizedBox(height: 20),
              _specialOffers(),

              // Tombol Pesan Sekarang
              SizedBox(height: 20),
              _orderNowButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Welcome Text dengan Animasi
  Widget _welcomeText() {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, Welcome to",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "MyRestaurant",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  // Restaurant Menu dengan Animasi
  Widget _restaurantMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: _containerHeight,
      child: Column(
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
          // Gunakan Flexible untuk GridView agar dapat mengatur ukuran
          Flexible(
            child: GridView.builder(
              shrinkWrap:
                  true, // Membuat GridView menyesuaikan dengan ruang yang tersedia
              physics:
                  NeverScrollableScrollPhysics(), // Menonaktifkan scroll default dari GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
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
                              imagePath:
                                  'assets/home_assets/gambar${index + 1}.jpg', quantity: 1,
                            ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.green[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/home_assets/gambar${index + 1}.jpg', // Gambar akan diambil dari direktori home_assets
                          width: 80, // Tentukan lebar gambar jika diperlukan
                          height: 80, // Tentukan tinggi gambar jika diperlukan
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Menu ${index + 1}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "\$15.99",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Special Offers dengan Animasi
  Widget _specialOffers() {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(seconds: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Special Offers",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          // Menggunakan SingleChildScrollView untuk menghindari overflow pada Card
          SingleChildScrollView(
            scrollDirection:
                Axis.horizontal, // Scroll horizontal jika konten panjang
            child: Card(
              color: Colors.orange[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.discount, size: 40, color: Colors.orange),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "20% Off on All Orders",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Valid till end of the month",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(width: 7),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Order Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tombol Pesan Sekarang
  Widget _orderNowButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
           Navigator.pushReplacementNamed(context, '/order');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "Order Now",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
