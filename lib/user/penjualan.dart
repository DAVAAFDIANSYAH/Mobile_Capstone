import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/maps.dart';
import 'package:flutter_application_coba_capsten/mapsbanksampah.dart';
import 'package:flutter_application_coba_capsten/user/Detailpenjualan.dart';
import 'package:flutter_application_coba_capsten/user/history.dart';
import 'package:flutter_application_coba_capsten/user/banksampah.dart';
import 'package:get/get.dart';
import 'profileuser.dart';
import '../deteksi.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  _PenjualanState createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  int _currentIndex = 0; // Indeks halaman aktif
  final List<String> jenisSampah = ['Plastik', 'Kertas', 'Logam']; // Opsi dropdown

  // Daftar halaman yang akan digunakan
  final List<Widget> _pages = [
    PenjualanPage(),
    Profile(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai indeks
      bottomNavigationBar: Container(
        height: 58,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900, // Dark Green
              Colors.green.shade300, // Lighter Green
            ],
            begin: Alignment.topLeft,  // Titik awal gradien
            end: Alignment.bottomRight, // Titik akhir gradien
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, // Indeks item aktif
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Mengubah halaman aktif
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.money_rounded),
              ),
              label: 'Pelayanan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.person),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.history),
              ),
              label: 'Riwayat',
            ),
          ],
          selectedItemColor: const Color.fromARGB(255, 22, 190, 27),
          unselectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 71, 136, 74),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

// Halaman Penjualan
class PenjualanPage extends StatefulWidget {
  const PenjualanPage({super.key});

  @override
  _PenjualanPageState createState() => _PenjualanPageState();
}

class _PenjualanPageState extends State<PenjualanPage> {
  String? selectedValue; // Menyimpan nilai yang dipilih pada dropdown
  final List<String> jenisSampah = ['botol plastic', 'Kertas', 'Logam', 'kardus', 'kaca'];
  final _formKey = GlobalKey<FormState>(); // Global key untuk form

  final TextEditingController _alamatController = TextEditingController(); // Controller untuk Alamat
  final TextEditingController _alamatBankSampahController = TextEditingController(); // Controller untuk Alamat Bank Sampah
  final TextEditingController _newFieldController = TextEditingController(); // Controller untuk Alamat Baru

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 140, 153, 25),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(200, 170, 153, 25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Form Penjualan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // DropdownJenis Sampah
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        items: jenisSampah.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.recycling,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(item),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        itemHeight: 50,
                        decoration: InputDecoration(
                          labelText: 'Jenis Sampah',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.workspaces_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih jenis sampah terlebih dahulu';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Berat Sampah',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.scale_outlined),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Berat sampah tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _alamatController,
                        decoration: InputDecoration(
                          labelText: 'Lokasi Pengguna',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.maps_home_work_outlined),
                        ),
                        onTap: () async {
                          final selectedLocation = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Maps()),
                          );
                          if (selectedLocation != null && selectedLocation.isNotEmpty) {
                            setState(() {
                              _alamatController.text = selectedLocation;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lokasi pengguna harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _newFieldController,
                        decoration: InputDecoration(
                          labelText: 'Detail Alamat user',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.add_to_home_screen_sharp),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Detail alamat harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _alamatBankSampahController,
                        decoration: InputDecoration(
                          labelText: 'Pilih Bank Sampah',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.map_sharp),
                        ),
                        onTap: () async {
                          final selectedBankSampahLocation = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Mapsbanksampah()),
                          );
                          if (selectedBankSampahLocation != null && selectedBankSampahLocation.isNotEmpty) {
                            setState(() {
                              _alamatBankSampahController.text = selectedBankSampahLocation;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih bank sampah terlebih dahulu';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPenjualanPage()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('Selanjutnya'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
