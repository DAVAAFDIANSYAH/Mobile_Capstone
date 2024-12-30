import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Mapsbanksampah extends StatefulWidget {
  const Mapsbanksampah({Key? key}) : super(key: key);

  @override
  _MapsbanksampahState createState() => _MapsbanksampahState();
}

class _MapsbanksampahState extends State<Mapsbanksampah> {
  GoogleMapController? _mapController;
  LocationData? _userLocation; // Gunakan nullable type
  late Location _location;
  Set<Marker> _bankSampahMarkers = {}; // Set untuk marker Bank Sampah
  String? _selectedBankSampahAddress;

  // Daftar lokasi Bank Sampah di Kota Tegal (contoh data)
  final List<Map<String, dynamic>> bankSampahList = [
  {
    'name': 'Bank Sampah Dewi Shinta',
    'latitude': -6.8646,
    'longitude': 109.1392,
    'address': 'Panggung, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Sejahtera',
    'latitude': -6.8600,
    'longitude': 109.1400,
    'address': 'Jl. Raya Tegal, Kec. Tegal Barat, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Tegal Makmur',
    'latitude': -6.8678,
    'longitude': 109.1415,
    'address': 'Jl. Raya Raya, Kec. Tegal Barat, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Rukun Jaya',
    'latitude': -6.8702,
    'longitude': 109.1427,
    'address': 'Jl. Pahlawan, Kec. Tegal Selatan, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Bangkit Bersama',
    'latitude': -6.8624,
    'longitude': 109.1358,
    'address': 'Jl. Laksda Adisucipto, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Artha Mandiri',
    'latitude': -6.8632,
    'longitude': 109.1423,
    'address': 'Jl. Veteran, Kec. Tegal Barat, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Tegal Lestari',
    'latitude': -6.8680,
    'longitude': 109.1381,
    'address': 'Jl. Siti Hawa, Kec. Tegal Selatan, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Melati Indah',
    'latitude': -6.8628,
    'longitude': 109.1343,
    'address': 'Jl. Raya Kramat, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Sumber Rejeki',
    'latitude': -6.8665,
    'longitude': 109.1409,
    'address': 'Jl. Angkatan Laut, Kec. Tegal Barat, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Putra Jaya',
    'latitude': -6.8630,
    'longitude': 109.1375,
    'address': 'Jl. Alamsyah, Kec. Tegal Selatan, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Tegal Baru',
    'latitude': -6.8644,
    'longitude': 109.1418,
    'address': 'Jl. Cimanuk, Kec. Tegal Barat, Kota Tegal, Jawa Tengah',
  },
  {
    'name': 'Bank Sampah Indah Karya',
    'latitude': -6.8605,
    'longitude': 109.1433,
    'address': 'Jl. Pemuda, Kec. Tegal Timur, Kota Tegal, Jawa Tengah',
  },
];
  @override
  void initState() {
    super.initState();
    _location = Location();
    _getUserLocation();
    _setMarkers();
  }

  // Mendapatkan lokasi pengguna
  Future<void> _getUserLocation() async {
    try {
      final location = await _location.getLocation();
      setState(() {
        _userLocation = location; // Inisialisasi lokasi pengguna
      });
    } catch (e) {
      print('Error mendapatkan lokasi: $e');
    }
  }

  // Menambahkan marker untuk setiap bank sampah
  void _setMarkers() {
    for (var bankSampah in bankSampahList) {
      final LatLng position = LatLng(bankSampah['latitude'], bankSampah['longitude']);
      _bankSampahMarkers.add(
        Marker(
          markerId: MarkerId(bankSampah['name']),
          position: position,
          infoWindow: InfoWindow(
            title: bankSampah['name'],
            snippet: bankSampah['address'],
          ),
          onTap: () {
            // Ketika marker dipilih, simpan alamat Bank Sampah yang dipilih
            setState(() {
              _selectedBankSampahAddress = bankSampah['address'];
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Bank Sampah Kota Tegal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_selectedBankSampahAddress != null) {
                // Kembali ke halaman sebelumnya dengan membawa alamat lokasi yang dipilih
                Navigator.pop(context, _selectedBankSampahAddress);
              } else {
                // Menampilkan pesan jika belum ada lokasi yang dipilih
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pilih lokasi bank sampah terlebih dahulu.')),
                );
              }
            },
          ),
        ],
      ),
      body: (_userLocation == null)
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                if (_userLocation != null) {
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(_userLocation!.latitude!, _userLocation!.longitude!),
                    ),
                  );
                }
              },
              initialCameraPosition: CameraPosition(
                target: _userLocation != null
                    ? LatLng(_userLocation!.latitude!, _userLocation!.longitude!)
                    : const LatLng(0, 0), // Default fallback
                zoom: 14.0,
              ),
              markers: _bankSampahMarkers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          );
        }
      }
