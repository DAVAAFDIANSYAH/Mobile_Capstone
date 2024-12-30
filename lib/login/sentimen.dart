import 'package:flutter/material.dart';

class Sentimenanalis extends StatefulWidget {
  const Sentimenanalis({super.key});

  @override
  _SentimenanalisState createState() => _SentimenanalisState();
}

class _SentimenanalisState extends State<Sentimenanalis> {
  final TextEditingController _reviewController = TextEditingController();
  String _submittedReview = "";  // Variabel untuk menyimpan review yang dikirim

  // Fungsi untuk menangani pengiriman review
  void _submitReview() {
    setState(() {
      _submittedReview = _reviewController.text.trim(); // Menyimpan review yang diketik
      _reviewController.clear();  // Mengosongkan kolom input setelah submit
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sentiment Analis'),
        backgroundColor: const Color.fromARGB(255, 20, 135, 192),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Write your Review',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _reviewController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'Share your experience...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),  // Menambahkan logika ketika tombol ditekan
                        child: Text('SUBMIT REVIEW'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Previous Reviews:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Menampilkan review yang sudah dikirimkan
            if (_submittedReview.isNotEmpty)
             if (_submittedReview.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  // padding: const EdgeInsets.all(16.0),
                  // color: Colors.grey[200],  // Warna latar belakang untuk review
                  child: Text(
                    _submittedReview,  // Menampilkan hasil review yang dimasukkan
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ), 
          ],
        ),
      ),
    );
  }
}
