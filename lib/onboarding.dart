import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/login/Login.dart';
import 'package:flutter_application_coba_capsten/login/page.dart'; // Ganti dengan halaman login atau halaman tujuan setelah onboarding

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
  'image': 'assets/onboard2.png', // Ganti dengan gambar yang sesuai
  'title': 'Jual Sampah, Dapatkan Keuntungan',
  'description':
      'Jual sampah anorganik Anda di aplikasi kami dan dapatkan uang atau reward. Berkontribusi pada lingkungan sekaligus meraih manfaat langsung dari setiap sampah yang Anda kelola.',
    },
    {
      'image': 'assets/onboard3.png', // Ganti dengan gambar yang sesuai
      'title': 'Isi Saldo untuk Transaksi',
      'description':
          'Isi saldo Anda dengan mudah dan nikmati kemudahan transaksi di aplikasi kami.',
    },
    {
      'image': 'assets/onboard5.png', // Ganti dengan gambar yang sesuai
      'title': 'Deteksi Jenis Sampah dengan AI',
      'description':
          'Gunakan teknologi AI kami untuk mendeteksi jenis sampah dengan cepat dan akurat.',
    },
    {
      'image': 'assets/onboard4.png', // Ganti dengan gambar yang sesuai
      'title': 'Bantuan dan Informasi',
      'description':
          'Dapatkan bantuan dan informasi seputar aplikasi melalui fitur chatbot kami.',
    },
    {
      'image': 'assets/onboard6.png', // Ganti dengan gambar yang sesuai
      'title': 'Cari Lokasi Bank Sampah Terdekat',
      'description':
          'Gunakan peta untuk mencari lokasi bank sampah terdekat di sekitar Anda.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
        colors: [Colors.green.shade900, Colors.green.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // PageView Content
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _onboardingData[index]['image']!,
                            height: 300,
                          ),
                          SizedBox(height: 20),
                          Text(
                            _onboardingData[index]['title']!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15),
                          Text(
                            _onboardingData[index]['description']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Dots Indicator and Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => Container(
                          margin: EdgeInsets.all(4.0),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Alihkan ke halaman utama atau halaman lain setelah onboarding
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(), // Ganti dengan halaman tujuan Anda
                              ),
                            );
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {
                            if (_currentPage < _onboardingData.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {
                              // Pindah ke halaman utama setelah onboarding selesai
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(), // Ganti dengan halaman tujuan Anda
                                ),
                              );
                            }
                          },
                          child: Text(
                            _currentPage == _onboardingData.length - 1
                                ? 'Finish'
                                : 'Next',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
