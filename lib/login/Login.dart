import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/pengepul/formpengepul.dart';
import 'package:flutter_application_coba_capsten/user/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade700, // Dark green
              Colors.green.shade300, // Lighter green
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'SIMPAS',
                style: TextStyle(
                  fontFamily: 'Lemon', // Font style
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Sistem Informasi Pengelolaan Sampah',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/WASTE.png', // Path to the image
                height: 350,
              ),
              const SizedBox(height: 20),

              // Login User Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Register page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 68, 143, 131),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Login User',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space between buttons

              // Login Pengepul Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to FormLoginpengepul
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormLoginpengepul()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 151, 55, 48),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Login Pengepul',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
