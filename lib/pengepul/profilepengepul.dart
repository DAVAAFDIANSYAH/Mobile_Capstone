import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/pengepul/formpengepul.dart';

class Profilepengepul extends StatelessWidget {
  const Profilepengepul({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: const Text('Profil', style: TextStyle(color: Colors.black)),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Profil
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/avatar.png'), // Tambahkan gambar profil di sini
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 20),
            
            // Username
            const Text(
              'USERNAME: RETZA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Alamat
            const Text(
              'ALAMAT: RANDUGUNTING',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // Jenis Kelamin
            const Text(
              'JENIS KELAMIN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Laki-laki',
                      groupValue: 'Laki-laki',
                      onChanged: (value) {},
                      activeColor: Colors.green,
                    ),
                    const Text('Laki-laki'),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Radio(
                      value: 'Perempuan',
                      groupValue: 'Laki-laki',
                      onChanged: (value) {},
                      activeColor: Colors.green,
                    ),
                    const Text('Perempuan'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Email
            const Text(
              'EMAIL ADDRESS: RETZA@GMAIL.COM',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // Tombol Log Out
           ElevatedButton(
  onPressed: () {
    // Tampilkan dialog konfirmasi logout
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Konfirmasi Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const FormLoginpengepul(), // Ganti dengan halaman login Anda
                  ),
                  (route) => false, // Hapus semua route sebelumnya
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    'LOG-OUT',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1, // Menandai halaman profil sebagai aktif
      //   onTap: (int index) {
      //     if (index == 0) {
      //       Navigator.pushNamed(context, '/topup'); // Navigasi ke halaman Top Up
      //     } else if (index == 2) {
      //       Navigator.pushNamed(context, '/pesan'); // Navigasi ke halaman Pesan
      //     }
      //   },
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.account_balance_wallet),
        //     label: 'Top up',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person),
        //     label: 'Profil',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.message),
        //     label: 'Pesan',
        //   ),
    //     // ],
    //     selectedItemColor: Colors.green,
    //   ),
    );
  }
}
