// import 'package:flutter/material.dart';
// import 'package:flutter_application_coba_capsten/mapsbanksampah.dart';
// import 'package:flutter_application_coba_capsten/user/Detailpenjualan.dart';

// class BankSampah extends StatefulWidget {
//   const BankSampah({super.key});

//   @override
//   State<BankSampah> createState() => _BankSampahState();
// }

// class _BankSampahState extends State<BankSampah> {
//   final TextEditingController _alamatController = TextEditingController();
//   String? _selectedBank; // Lokasi bank sampah yang dipilih

//   @override
//   void dispose() {
//     _alamatController.dispose(); // Membersihkan controller saat widget dihancurkan
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(160, 134, 153, 25),
//       body: Column(
//         children: [
//           // Bagian header dengan gambar full-width
//           Stack(
//             children: [
//               // Gambar header
//               Container(
//                 width: double.infinity,
//                 height: 290,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/prof.png'), // Pastikan asset sesuai
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // Tombol kembali
//               Positioned(
//                 top: 40,
//                 left: 3,
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           // Bagian Card Bank Sampah
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(200, 170, 153, 25),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(24),
//                   topRight: Radius.circular(24),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   // TextField untuk maps bank sampah
//                   TextField(
//                     controller: _alamatController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       labelText: 'Maps bank sampah',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onTap: () async {
//                       // Pilih lokasi dari halaman Mapsbanksampah
//                       final selectedLocation = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const Mapsbanksampah(),
//                         ),
//                       );
//                       if (selectedLocation != null) {
//                         setState(() {
//                           _selectedBank = selectedLocation; // Simpan lokasi terpilih
//                           _alamatController.clear(); // Reset isi TextField
//                         });
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   // Menampilkan kartu bank sampah yang dipilih
//                   if (_selectedBank != null)
//                     Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       elevation: 4,
//                       color: const Color.fromARGB(197, 166, 213, 142),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // Text(
//                                   //   'Lokasi Bank Sampah Terpilih:',
//                                   //   style: const TextStyle(
//                                   //     fontSize: 18,
//                                   //     fontWeight: FontWeight.bold,
//                                   //   ),
//                                   // ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     _selectedBank!,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black87,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const DetailPenjualanPage(),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 shape: const CircleBorder(),
//                                 padding: const EdgeInsets.all(12),
//                               ),
//                               child: const Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                                 size: 24.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
