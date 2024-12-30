import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/login/login.dart';
import 'package:flutter_application_coba_capsten/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboard(), // Pastikan ini sesuai dengan nama halaman yang Anda inginkan
      debugShowCheckedModeBanner: false,
    );  
  }
}
