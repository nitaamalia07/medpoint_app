import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Kelas untuk menghubungkan dengan Supabase dan mengambil data dokter
class DoctorService {
  final SupabaseClient supabase = Supabase.instance.client;

  // Ambil semua dokter
  Future<List<Doctor>> getAllDoctors() async {
    // Mengambil data dari Supabase
    // ignore: deprecated_member_use
    final response =
        await supabase
            .from('doctors')
            .select('name, specialization')
            // ignore: deprecated_member_use
            .execute();

    if (response.error == null) {
      final data = response.data as List;
      // Parsing data dan menampilkannya
      if (kDebugMode) {
        print(data);
      }
    } else {
      if (kDebugMode) {
        print('Error: ${response.error!.message}');
      }
    }

    // Log data untuk debugging
    if (kDebugMode) {
      print(response.data);
    }

    // Mengonversi data yang didapat menjadi list of Doctor
    return (response.data as List)
        .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

extension on PostgrestResponse {
  get error => null;
}

// Kelas untuk mendefinisikan struktur data Doctor
class Doctor {
  final String name;
  final String specialization;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.specialization,
    required this.imageUrl,
  });

  // Fungsi untuk mengonversi JSON ke objek Doctor
  static Doctor fromJson(Map<String, dynamic> json) {
    return Doctor(
      name:
          json['name'] as String? ??
          'Unknown', // Menangani null dengan nilai default
      specialization:
          json['specialization'] as String? ??
          'No specialization', // Menangani null dengan nilai default
      imageUrl:
          json['photo_url'] as String? ??
          '', // Menangani null dengan nilai default
    );
  }
}
