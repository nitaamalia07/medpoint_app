// lib/models/doctor.dart
class Doctor {
  final String name;
  final String specialization;
  final String photoUrl; // Nama file gambar, bukan URL

  Doctor({
    required this.name,
    required this.specialization,
    required this.photoUrl,
  });

  static Doctor fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'] ?? 'Unknown',
      specialization: json['specialization'] ?? 'No specialization',
      photoUrl: json['photo_url'] ?? '', // Ini nama file gambar
    );
  }
}
