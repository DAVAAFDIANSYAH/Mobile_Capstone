import 'package:flutter/material.dart';

class Detailnotif extends StatefulWidget {
  const Detailnotif({super.key});

  @override
  _DetailnotifState createState() => _DetailnotifState();
}

class _DetailnotifState extends State<Detailnotif> {
  int _selectedIndex = 1;

  // Data notifikasi
  String? nama = 'Depa';
  String? alamat = 'Panggung, Kec. Tegal Timur, Kota Tegal, Jawa Tengah';
  String? jenisSampah = 'Botol plastik';
  String? beratSampah = '5 kg';

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     // Implement navigasi sesuai kebutuhan Anda
  //   });
  // }

  void _ambilNotifikasi() {
    // Tampilkan dialog popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Pesanan Berhasil di Ambil'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // Hapus data notifikasi
    setState(() {
      nama = null;
      alamat = null;
      jenisSampah = null;
      beratSampah = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/background.jpg', // Pastikan gambar ini terdaftar di pubspec.yaml
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header atas dengan gambar
              Container(
                height: 300,
                decoration: BoxDecoration(
                  // color: Colors.white.withOpacity(0.6),
                  image: DecorationImage(
                    image: const AssetImage('assets/detail.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          // IconButton(
                          //   icon: const Icon(Icons.arrow_back, color: Colors.green),
                          //   onPressed: () {
                          //     Navigator.pop(context); // Tombol kembali
                          //   },
                          // ),
                          const SizedBox(width: 8),
                          // const Text(
                          //   "Notifikasi",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 24,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // const Text(
                      //   "Notifikasi pesanan dari penjual: Menginformasikan "
                      //   "kepada pengepul bahwa terdapat sampah di tempat penjual.",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 14,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // Body bagian bawah
              Expanded(
                child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text(
                        //   "Detail Notifikasi",
                        //   style: TextStyle(
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        // Detail informasi notifikasi
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Nama',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(nama ?? '', textAlign: TextAlign.end),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const Text(
                                      'Alamat',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Flexible(
                                      child: Text(
                                        alamat ?? '',
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const Text(
                                      'Jenis sampah',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(jenisSampah ?? '', textAlign: TextAlign.end),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    const Text(
                                      'Berat sampah',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(beratSampah ?? '', textAlign: TextAlign.end),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: _ambilNotifikasi,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 12),
                                    ),
                                    child: const Text(
                                      'Ambil',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
