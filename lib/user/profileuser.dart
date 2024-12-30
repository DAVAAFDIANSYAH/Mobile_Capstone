import 'dart:convert';
import 'package:flutter_application_coba_capsten/login/Login.dart';
import 'package:flutter_application_coba_capsten/user/formlogin.dart';
import 'package:flutter_application_coba_capsten/user/penjualan.dart'; // Pastikan penjualan.dart ada di path ini
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _userName = '';
  String _email = '';
  bool _isLoading = true;

  // ID pengguna yang sedang login
  final int userId = 1;  // Ganti dengan ID pengguna yang sedang login

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Fungsi untuk mengambil data dari API
  Future<void> _getUserData() async {
    final response = await http.get(
      Uri.parse('http://192.168.73.173:3000/getUserData?user_id=$userId'),
    );

    if (response.statusCode == 200) {
      // Jika server merespons dengan kode status 200 (OK)
      var data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        setState(() {
          _userName = data['nama'];
          _email = data['email'];
          _isLoading = false;
        });
      } else {
        // Menangani kesalahan jika data tidak ditemukan
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // Menangani kesalahan jika API gagal
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load user data');
    }
  }

  // Fungsi untuk logout
  void _logOut() {
    // Implementasi logout, bisa dengan menghapus token atau data login lainnya
    // Misalnya dengan menghapus token atau state login
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Anda telah keluar!")), // Hapus const di sini
    );
    // Arahkan ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FormLogin()),  // Hapus const di sini
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

        child: _isLoading
            ? const Center(child: CircularProgressIndicator())  // Menampilkan indikator loading
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/ulhuq.jpeg'), // Gambar default
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _userName.isEmpty ? 'Nama tidak ditemukan' : _userName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _email.isEmpty ? 'Email tidak ditemukan' : _email,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _logOut,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Warna tombol log out
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      ), // Panggil fungsi logout
                      child: Text('Log Out'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
