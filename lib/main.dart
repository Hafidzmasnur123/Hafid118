import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Desain Widget Kombinasi'),
          backgroundColor: Colors.blueAccent,
        ),
        // Latar belakang abu-abu agar kartu terlihat
        backgroundColor: Colors.grey[200],
        body: const Center(
          // Memanggil widget utama kita
          child: ProfileCard(),
        ),
      ),
    );
  }
}

// Ini adalah widget kustom yang menggabungkan semua elemen
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      // Dekorasi untuk membuat tampilan seperti kartu (bayangan, radius)
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // Padding internal untuk memberi jarak dari tepi kartu
      child: Padding(
        padding: const EdgeInsets.all(24.0),

        // (LAYOUT COLUMN)
        // Layout utama: COLUMN (Menyusun widget ke bawah)
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Agar ukuran Column pas dengan isinya
          children: [
            // 1. (WIDGET IMAGE)
            // Gambar profil
            const CircleAvatar(
              radius: 50,
              // Kita gunakan gambar placeholder dari internet
              backgroundImage: NetworkImage('https://picsum.photos/id/237/200'),
            ),
            const SizedBox(height: 16), // Memberi jarak
            // (LAYOUT ROW)
            // Layout kedua: ROW (Menyusun widget ke samping)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 2. (WIDGET TEXT)
                // Teks Nama Pengguna
                const Text(
                  'Hafid Masnurillah',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8), // Jarak antara Teks dan Ikon
                // 3. (WIDGET ICON)
                // Ikon Verifikasi
                const Icon(Icons.verified, color: Colors.blueAccent, size: 20),
              ],
            ),
            const SizedBox(height: 8), // Jarak
            // 4. (WIDGET TEXT)
            // Teks Bio
            Text(
              'Sedang belajar membuat layout kombinasi Row dan Column.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24), // Jarak
            // 5. (WIDGET BUTTON)
            // Tombol "Ikuti"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                // Aksi ketika tombol ditekan
                print('Tombol Ikuti ditekan!');
              },
              child: const Text('Ikuti', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
