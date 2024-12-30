import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  LocationData? _currentLocation;
  late Location _location;
  late StreamSubscription<LocationData> _locationSubscription;
  String? _selectedAddress; // Alamat lokasi pengguna

  @override
  void initState() {
    super.initState();
    _location = Location();
    _getUserLocation();
    _startLocationUpdates();
  }

  // Mendapatkan lokasi pengguna
  Future<void> _getUserLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location services are disabled.');
        }
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw Exception('Location permission not granted.');
        }
      }

      final currentLocation = await _location.getLocation();
      setState(() {
        _currentLocation = currentLocation;
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
        );
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(currentLocation.latitude!, currentLocation.longitude!),
          14.0,
        ),
      );
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Memulai streaming update lokasi pengguna secara real-time
  void _startLocationUpdates() {
    _locationSubscription = _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
        _markers.clear(); // Menghapus marker sebelumnya
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            infoWindow: const InfoWindow(title: 'Your Location'),
          ),
        );
      });

      // Update posisi kamera peta ke lokasi pengguna
      _updateMapCamera(LatLng(currentLocation.latitude!, currentLocation.longitude!));
    });
  }

  // Update kamera peta ke lokasi pengguna
  Future<void> _updateMapCamera(LatLng newPosition) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  @override
  void dispose() {
    _locationSubscription.cancel(); // Hentikan streaming saat halaman di-dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time User Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, _selectedAddress); // Mengirimkan alamat atau koordinat lokasi pengguna
            },
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-6.8800, 109.1390), // Default position (fallback)
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (LatLng position) {
          setState(() {
            _markers.clear();
            _markers.add(
              Marker(
                markerId: const MarkerId('tappedLocation'),
                position: position,
                infoWindow: const InfoWindow(title: 'Tapped Location'),
              ),
            );
            _selectedAddress = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
          });
        },
      ),
    );
  }
}
