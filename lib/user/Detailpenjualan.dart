import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/deteksi.dart';
import 'package:flutter_application_coba_capsten/login/page.dart';
import 'package:flutter_application_coba_capsten/user/penjualan.dart';
import 'package:flutter_application_coba_capsten/user/profileuser.dart';

class DetailPenjualan extends StatefulWidget {
  const DetailPenjualan({super.key});

  @override
  _DetailPenjualanState createState() => _DetailPenjualanState();
}

class _DetailPenjualanState extends State<DetailPenjualan> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Penjualan(),
    const Profile(),
    const Deteksi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Active item index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Switch active page
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Penjualan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Kartu',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to DetailPenjualanPage when pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPenjualanPage(),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.info),
      ),
    );
  }
}

class DetailPenjualanPage extends StatelessWidget {
  const DetailPenjualanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(160, 134, 153, 25),
      body: Column(
        children: [
          // Header section with full-width image, back button, and overlay text
          Stack(
            children: [
              // Header image
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 5,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Container(
                  // padding: const EdgeInsets.all(8),
                  // decoration: BoxDecoration(
                  //   color: Colors.black.withOpacity(0.6),
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Penjualan',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 8),
                      // Text(
                      //   'Sampah anorganik adalah jenis sampah yang berasal dari bahan-bahan yang sulit terurai oleh mikroorganisme dalam tanah atau lingkungan.',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 14,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color:Color.fromARGB(200, 170, 153, 25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 141, 173, 189),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bank Sampah Dewi Shinta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Jenis sampah: Botol Plastik'),
                        SizedBox(height: 4),
                        Text('Berat sampah: 5kg'),
                        SizedBox(height: 4),
                        Text(
                          'Alamat: Jl. Sumbing no.12 rt 08 rw 05, Kelurahan Panggung, Tegal',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4, // Atur lebar tombol (80% dari layar)
                          child: ElevatedButton(
                            onPressed: () {
                              // Tampilkan SnackBar dengan pesan "Penjualan berhasil"
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Penjualan success!'),
                                  backgroundColor: Colors.blueGrey, // Menambahkan warna latar belakang
                                  duration: Duration(seconds: 2), // Durasi tampilan SnackBar
                                ),
                              );

                              // Navigasi ke halaman Penjualan setelah penjualan berhasil
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HalamanAwal()), // Ganti dengan halaman Penjualan
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: const StadiumBorder(), // Membuat tombol berbentuk oval
                            ),
                            child: const Text('Jual'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
