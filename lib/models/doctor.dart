import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Doctor {
  final String name;
  final String specialization;
  final String imageUrl; // nama file gambar

  Doctor({
    required this.name,
    required this.specialization,
    required this.imageUrl,
  });

  // Fungsi untuk memetakan data JSON ke objek Doctor
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization:
          json['specialization'] ??
          'No specialization', // Menangani jika specialization null
      imageUrl: json['photo_url'] ?? '', // Menangani jika photo_url null
    );
  }
}

// Fungsi untuk mengambil data dokter dari Supabase
Future<List<Doctor>> fetchDoctors() async {
  final response =
      await Supabase.instance.client
          .from('doctors')
          .select('name, specialization, photo_url')
          // ignore: deprecated_member_use
          .execute();

  if (response.error != null) {
    if (kDebugMode) {
      if (kDebugMode) {
        print('Error: ${response.error!.message}');
      }
    }
    return [];
  }

  final doctors =
      (response.data as List).map((json) => Doctor.fromJson(json)).toList();

  return doctors;
}

extension on PostgrestResponse {
  get error => null;
}
