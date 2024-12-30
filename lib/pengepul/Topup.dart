import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/pengepul/DeteailTopUp.dart';
import 'package:flutter_application_coba_capsten/pengepul/notifpengepul.dart';
import 'package:flutter_application_coba_capsten/pengepul/profilepengepul.dart';

class Topup extends StatefulWidget {
  const Topup({super.key});

  @override
  _TopupState createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  int _currentIndex = 0; // Active page index

  // List of pages to navigate to
  final List<Widget> _pages = [
    const TopUpPage(), // Top-Up page
    const Notifpengepul(), // Notification page
    const Profilepengepul(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent overflow caused by keyboard
      body: _pages[_currentIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Active item index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Switch active page
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.money_rounded),
            ),
            label: 'Top-Up',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.notification_add),
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  // Function to build a top-up option
  Widget buildTopUpOption(BuildContext context, String points, String price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Points and price info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  points,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            // Select button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailTopup()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Pilih",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Bagian header dengan gambar full-width dan tombol kembali
          Stack(
            children: [
              // Gambar header
              Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/onboard1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol kembali
              // Positioned(
              //   top: 40,
              //   left: 16,
              //   child: IconButton(
              //     icon: const Icon(Icons.arrow_back, color: Colors.white),
              //     onPressed: () {
              //       Navigator.pop(context); // Mengarahkan kembali ke halaman sebelumnya
              //     },
              //   ),
              // ),
            ],
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Top-Up",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Top-Up Options
                          buildTopUpOption(context, '5 Points', 'Rp 15.000'),
                          buildTopUpOption(context, '10 Points', 'Rp 30.000'),
                          buildTopUpOption(context, '20 Points', 'Rp 60.000'),
                          buildTopUpOption(context, '30 Points', 'Rp 80.000'),
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
