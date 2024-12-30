import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({"user": text, "bot": "Respon dari bot untuk: $text"});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 121, 165, 138), // Latar belakang AppBar menjadi hijau
          title: const Text(
            'CHATBOT',
            style: TextStyle(
              fontFamily: 'roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green, // Teks tetap terlihat dengan warna putih
            ),
          ),
          centerTitle: true, // Memposisikan judul di tengah
        ),
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/chatbot.png'), // Path gambar
                fit: BoxFit.cover, // Gambar memenuhi seluruh layar
              ),
            ),
          ),
          // Konten ChatBot
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              message['user']!,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            message['bot']!,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Tulis pesan...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, // Agar lebih terlihat di atas gambar
                          fillColor: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 9.0),
                    IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.blue,
                      onPressed: _sendMessage,
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
