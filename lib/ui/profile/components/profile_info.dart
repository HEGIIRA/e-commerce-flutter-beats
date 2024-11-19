import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  //ini tinggal dipanggil di kode yg dibawah, misalnya text, nah dipanggil di data nya tuh si ini
  final String name;
  final String email;
  final String password;

  const ProfileInfo({
    super.key,
    //ini kan required si data nya yg brarti nnti pas page ini dipanggil merkea tuh wajib diisi
    required this.name, 
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Center( // biar semua konten ada di tengah layar
      child: Column(
        mainAxisSize: MainAxisSize.min, // Menyusutkan kolom berdasarkan isi
        crossAxisAlignment: CrossAxisAlignment.start, // biar label text sama si kotaknya tuh tetep mulai dari kiri
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Full Name",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w700,
                color: Colors.black
              ),
            ),
          ),
          Container(
            width: 400, // Lebar tetap agar tidak melebar penuh
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(name, style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            )),
          ),
          const SizedBox(height: 16),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Email Address",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w700,
                color: Colors.black
              ),
            ),
          ),
          Container(
            width: 400, // Lebar tetap agar tidak melebar penuh
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(email, style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            )),
          ),
          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w700,
                color: Colors.black
              ),
            ),
          ),
          Container(
            width: 400, // Lebar tetap agar tidak melebar penuh
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(password, style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            )),
          ),
        ],
      ),
    );
  }
}
