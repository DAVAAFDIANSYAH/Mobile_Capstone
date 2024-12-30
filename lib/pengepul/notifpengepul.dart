import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/pengepul/detailnotif.dart';

class Notifpengepul extends StatelessWidget {
  const Notifpengepul({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Bagian header dengan gambar full-width, tombol kembali, dan teks di atasnya
          Stack(
            children: [
              // Gambar header
              Container(
                width: double.infinity,
                height: 370,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mapsuser.png'), // Pastikan asset sesuai
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol kembali
              // Positioned(
              //   top: 40,
              //   left: 3,
              //   child: IconButton(
              //     icon: const Icon(Icons.arrow_back, color: Colors.white),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
              // Teks di atas gambar
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
                      //   'Pilih Bank Sampah',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 8),
                      // Text(
                      //   'Pilih bank sampah untuk menjual sampah anorganik Anda.',
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
          const SizedBox(height: 10),
          // Bagian Card Bank Sampah
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
   decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.green[900]!, // Hijau gelap
      Colors.green[300]!, // Hijau terang
    ],
    begin: Alignment.topLeft,  // Awal gradien
    end: Alignment.bottomRight, // Akhir gradien
  ),
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  ),
),


              child: ListView.builder(
                itemCount: 5, 
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Notifpengepulcard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notifpengepulcard extends StatelessWidget {
  const Notifpengepulcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      color:  const Color.fromARGB(197, 166, 213, 142),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dapa',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Panggung, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 4),
                  // Row(
                  //   children: [
                  //     Icon(Icons.access_time, size: 16, color: Colors.grey),
                  //     SizedBox(width: 4),
                  //     Text(
                  //       'Jam Buka: 09.00 - 17.00',
                  //       style: TextStyle(fontSize: 14, color: Colors.grey),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(width: 10),
           ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Detail Penjualan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Detailnotif()), // Pastikan nama kelas sesuai
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const CircleBorder(), // Membuat tombol berbentuk lingkaran
                  padding: const EdgeInsets.all(12), // Padding di sekitar ikon
                ),
                child: const Icon(
                  Icons.arrow_forward, // Ikon yang ingin digunakan
                  color: Colors.white, // Warna ikon
                  size: 24.0, // Ukuran ikon
                ),
              )
            ],
          ),
        ),
      );
    }
  }
