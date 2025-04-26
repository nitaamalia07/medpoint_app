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
