import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/deteksi.dart';
import 'package:flutter_application_coba_capsten/login/chatbot.dart';
import 'package:flutter_application_coba_capsten/login/sentimen.dart';
import 'package:flutter_application_coba_capsten/user/penjualan.dart';

class HalamanAwal extends StatelessWidget {
  const HalamanAwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header dengan lengkungan bawah
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 250, // Tinggi header
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.shade900, // Dark Green
                      Colors.green.shade300, // Lighter Green
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Selamat datang dava',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/ulhuq.jpeg'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bagian konten grid
          Padding(
            padding: const EdgeInsets.only(top: 300), // Jarak dari bawah header
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: [
                _buildMenuItem(
                  context,
                  title: 'Sentimen',
                  image: 'assets/analisis.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sentimenanalis()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: 'Chatbot',
                  image: 'assets/market.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatBot()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  title: 'Penjualan',
                  image: 'assets/penjualan.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Penjualan()),
                    );
                  },
                ),
                 _buildMenuItem(
                  context,
                  title: 'Deteksi',
                  image: 'assets/onboard5.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Deteksi()),
                    );
                  },
                ),  
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.green.shade300],
            begin: Alignment.topLeft,  // Titik awal gradien
            end: Alignment.bottomRight, // Titik akhir gradien
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 130,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomClipper untuk membuat lengkungan pada header
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Garis lurus dari kiri
    path.quadraticBezierTo(
      size.width / 2, size.height, // Titik tengah lengkungan
      size.width, size.height - 50, // Garis ke kanan
    );
    path.lineTo(size.width, 0); // Garis lurus ke atas
    path.close(); // Tutup path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Tidak perlu repaint
  }
}
