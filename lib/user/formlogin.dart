import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/login/landingpage.dart';
import 'package:flutter_application_coba_capsten/login/page.dart';
import 'package:flutter_application_coba_capsten/user/penjualan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';  // Import package google_sign_in

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  _FormLoginState createState() => _FormLoginState();

  static bool validateEmail(String email) {
    return email.isNotEmpty &&
        email.contains('@') &&
        email.endsWith('@gmail.com');
  }

  static bool validatePassword(String password) {
    return password.length >= 6;
  }
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn();  // Instance GoogleSignIn

  // Fungsi validasi email
  bool validateEmail(String email) {
    return email.isNotEmpty &&
        email.contains('@') &&
        email.endsWith('@gmail.com');
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }

  void _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (!validateEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak valid. Gunakan email @gmail.com')),
      );
      return;
    }

    if (!validatePassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password harus memiliki minimal 6 karakter')),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://fluttermysqlapi.vercel.app/api/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['message'] == 'Login berhasil') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HalamanAwal()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Login gagal')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login gagal, periksa email dan password')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal terhubung ke server')),
      );
    }
  }

 Future<void> _handleGoogleSignIn(BuildContext context) async {
  try {
    // Pastikan untuk sign out sebelum login
    await _googleSignIn.signOut();  // Menghapus sesi login sebelumnya

    // Lakukan login dan biarkan pengguna memilih akun
    GoogleSignInAccount? user = await _googleSignIn.signIn();

    if (user != null) {
      // Login berhasil, tampilkan pesan selamat datang
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selamat datang, ${user.displayName}!')),
      );

      // Lanjutkan ke halaman berikutnya setelah login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HalamanAwal()), // Ganti dengan halaman tujuan
      );
    } else {
      // Jika pengguna membatalkan login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Google dibatalkan!')),
      );
    }
  } catch (e) {
    // Menampilkan error jika login gagal
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal login dengan Google: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(128, 9, 247, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                '',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 20),
              Image.asset(
                'assets/user.png',
                height: 300,
              ),
              const SizedBox(height: 30),
              // Input Email
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.green),
                  labelText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Input Password
              TextField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.green),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password clicked!')),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Google Login
              InkWell(
                onTap: () {
                  _handleGoogleSignIn(context);  // Panggil fungsi login Google
                },
                child: Image.asset(
                  'assets/logoGoogle.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
