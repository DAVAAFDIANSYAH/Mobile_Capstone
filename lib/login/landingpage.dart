// import 'package:flutter_application_coba_capsten/deteksi.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_coba_capsten/user/penjualan.dart';
// import 'package:flutter_application_coba_capsten/user/profileuser.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});

//   @override
//   _LandingPageState createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int _selectedIndex = 0;
  

//   final List<Widget> _pages = [
//     Penjualan(),
//     Profile(),  
//     Deteksi(),  
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0, // Remove shadow
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.money_rounded),
//             label: 'Penjualan',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.qr_code_scanner),
//             label: 'Deteksi',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         onTap: _onItemTapped,
//       ),
//       backgroundColor: const Color.fromARGB(255, 20, 138, 234),
//     );
//   }
// }

// // HomePage widget with Form Section
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Column(
// //         children: [
// //           Stack(
// //             children: [
// //               Container(
// //                 width: double.infinity,
// //                 height: 200,
// //                 decoration: BoxDecoration(
// //                   image: DecorationImage(
// //                     image: AssetImage('assets/background.jpg'),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 width: double.infinity,
// //                 height: 200,
// //                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                     colors: [
// //                       Colors.black.withOpacity(0.6),
// //                       Colors.transparent,
// //                       Colors.black.withOpacity(0.6),
// //                     ],
// //                   ),
// //                 ),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: [
// //                     Text(
// //                       'Penjualan',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     SizedBox(height: 8),
// //                     Text(
// //                       'Sampah anorganik adalah jenis sampah yang sulit terurai.',
// //                       style: TextStyle(color: Colors.white, fontSize: 14),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: 20),
// //           Expanded(
// //             child: Container(
// //               padding: EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(24),
// //                   topRight: Radius.circular(24),
// //                 ),
// //               ),
// //               // child: FormSection(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class FormSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Form',
// //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         // SizedBox(height: 20),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: 'Jenis sampah',
// //             prefixIcon: Icon(Icons.delete, color: Colors.green),
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //           ),
// //         ),
// //         SizedBox(height: 16),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: 'Berat sampah',
// //             prefixIcon: Icon(Icons.scale, color: Colors.green),
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //           ),
// //           keyboardType: TextInputType.number,
// //         ),
// //         SizedBox(height: 16),
// //         TextField(
// //           decoration: InputDecoration(
// //             labelText: 'Alamat',
// //             prefixIcon: Icon(Icons.location_on, color: Colors.green),
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //           ),
// //         ),
// //         Spacer(),
// //         SizedBox(
// //           width: double.infinity,
// //           child: ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => BankSampah()),
// //               );
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.green,
// //               padding: EdgeInsets.symmetric(vertical: 16),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //             ),
// //             child: Text(
// //               'Selanjutnya',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

