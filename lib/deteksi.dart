import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application_coba_capsten/user/penjualan.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Deteksi extends StatefulWidget {
  const Deteksi({super.key});

  @override
  _DeteksiState createState() => _DeteksiState();
}

class _DeteksiState extends State<Deteksi> {
  io.File? _image;
  String? _imageUrl;
  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _imageUrl = pickedFile.path;
        } else {
          _image = io.File(pickedFile.path);
        }
      });
    }
  }

  // Fungsi untuk membuka kamera
  Future<void> openCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _imageUrl = pickedFile.path;
        } else {
          _image = io.File(pickedFile.path);
        }
      });
    } else {
      print("No image selected.");
    }
  }

  // Fungsi untuk mendeteksi sampah (contoh implementasi)
  void _detectWaste() {
    // Logika deteksi sampah bisa dimasukkan di sini.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deteksi sampah berjalan...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            Stack(
              children: [
                // Gambar header
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/deteksi.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: kIsWeb
                            ? (_imageUrl == null
                                ? const Center(child: Text(""))
                                : Image.network(_imageUrl!, height: 300, fit: BoxFit.cover))
                            : (_image == null
                                ? const Center(child: Text(""))
                                : Image.file(_image!, height: 300, fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Tombol Pilih Gambar dari Galeri
                        IconButton(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.photo_library, color: Colors.blueAccent, size: 50),
                          tooltip: "Pilih Gambar", // Tooltip untuk memberikan info saat di-hover
                        ),

                        // Tombol Buka Kamera
                        IconButton(
                          onPressed: openCamera,
                          icon: const Icon(Icons.camera_alt, color: Colors.blueAccent, size: 50),
                          tooltip: "Buka Kamera", // Tooltip untuk memberikan info saat di-hover
                        ),

                        // Tombol Deteksi Sampah
                        IconButton(
                          onPressed: _detectWaste,
                          icon: const Icon(Icons.search, color: Colors.blueAccent, size: 50),
                          tooltip: "Deteksi Sampah", // Tooltip untuk memberikan info saat di-hover
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
