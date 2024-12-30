import 'package:flutter/material.dart';
import 'package:flutter_application_coba_capsten/user/history.dart';
import 'package:flutter_application_coba_capsten/user/Detailpenjualan.dart';
import 'package:flutter_application_coba_capsten/user/banksampah.dart';
import 'package:flutter_application_coba_capsten/pengepul/detailnotif.dart';
import 'package:flutter_application_coba_capsten/login/landingpage.dart';
import 'package:flutter_application_coba_capsten/user/formlogin.dart';
import 'package:flutter_application_coba_capsten/user/register.dart';
import 'package:flutter_application_coba_capsten/user/penjualan.dart';
import 'package:flutter_application_coba_capsten/user/profileuser.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const splash = '/';
  static const formLogin = '/formLogin';
  static const halamanDaftar = '/halamanDaftar';
  // static const landingPage = '/landingPage';
  static const penjualan = '/penjualan';
  static const bankSampah = '/bankSampah';
  static const detailNotif = '/detailNotif';
  static const profilePage = '/profilePage';
  static const detailPenjualan = '/detailPenjualan';
  static const halamanAwal = '/halamanAwal';
  static const history = '/history';

  static final routes = [
    GetPage(name: formLogin, page: () => FormLogin()), // Halaman login
    GetPage(name: halamanDaftar, page: () => const Register()), // Halaman daftar (registrasi)
    // GetPage(name: landingPage, page: () => landingPage()), // Halaman landing
    GetPage(name: penjualan, page: () => const Penjualan()), // Halaman penjualan
    // GetPage(name: bankSampah, page: () => const BankSampah()), // Halaman bank sampah
    GetPage(name: detailNotif, page: () => const Detailnotif()), // Halaman detail notifikasi
    GetPage(name: profilePage, page: () => const Profile()), // Halaman profil
    GetPage(name: detailPenjualan, page: () => const DetailPenjualanPage()), // Detail penjualan
    GetPage(name: history, page: () => History()), // Halaman riwayat
    // GetPage(name: halamanAwal, page: () => HalamanAwal()),
  ];
}
