import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final List<Map<String, String>> historyItems = [
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
    {
      'name': 'bank sampah',
      'jenis sampah': 'botol plastik',
      'berat sampah': '5kg',
      'Alamat': 'Jl wekudoro',
    },
  ];

  History({super.key}); // Removed const here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('History'),
      //   backgroundColor: const Color.fromARGB(255, 153, 210, 155),
      // ),
      body: Container(
        // Mengatur background halaman
        decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.green.shade900, // Dark Green
      Colors.green.shade300, // Lighter Green
    ],
    begin: Alignment.topLeft,  // Titik awal gradien
    end: Alignment.bottomRight, // Titik akhir gradien
  ),
),

        child: Column(
          children: [
            // Tab bar simulation
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: historyItems.length,
                itemBuilder: (context, index) {
                  final item = historyItems[index];
                  return ListTile(
                    leading: const Icon(Icons.recycling, color: Color.fromARGB(255, 17, 50, 18), size: 40),
                    title: Text(
                      item['name']!,
                      style: const TextStyle( color: Colors.blue),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['jenis sampah']!),
                        Text(item['berat sampah']!, style: const TextStyle(color: Colors.grey)),
                        Text(item['Alamat']!, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
