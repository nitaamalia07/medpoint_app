import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String imageUrl;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.imageUrl,
  });

  get images => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Gambar Dokter dengan ClipRRect untuk efek rounded corner
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/$imageUrl', // Menggunakan path yang benar
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color:
                      Colors
                          .grey, // Menampilkan warna grey jika gambar tidak ditemukan
                  child: Icon(
                    Icons.error,
                    color: Colors.white,
                  ), // Tampilkan icon error
                );
              },
            ),
          ),

          SizedBox(width: 15), // Padding antara gambar dan teks
          // Detail Dokter
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  specialization,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    // Tombol Call Now
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk Call Now
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Call Now'),
                    ),
                    SizedBox(width: 10), // Spacing antar tombol
                    // Tombol Book Appointment
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk Book Appointment
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Book Appointment'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
