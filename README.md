### 📱 [Mobile] Slicing & Integration Doctor Screen

Halaman daftar dokter akan menampilkan data dokter yang diambil dari Supabase menggunakan API REST yang telah dibuat sebelumnya. Teknologi yang digunakan adalah Flutter, dengan penerapan clean architecture, state management menggunakan `flutter_bloc`, dan dependensi injection menggunakan `get_it`.

## ⚙️ Teknologi yang Digunakan
- **Flutter**: Framework untuk membangun aplikasi mobile.
- **Supabase**: Backend-as-a-Service untuk mengelola database dan autentikasi.
- **flutter_bloc**: State management untuk aplikasi Flutter.
- **get_it**: Dependency injection untuk pengelolaan dependensi dalam aplikasi.
- **jam.dev**: Untuk merekam video penjelasan tugas.

## 🧱 Struktur Proyek
```
medpoint_app/
├── lib/
│ ├── data/
│ │ ├── datasources/
│ │ │ └── doctor_service.dart
│ │ ├── models/
│ │ │ └── doctor_model.dart
│ │ └── repositories/
│ │ └── doctor_repository_impl.dart
│ ├── domain/
│ │ ├── entities/
│ │ │ └── doctor_entity.dart
│ │ ├── repositories/
│ │ │ └── doctor_repository.dart
│ │ └── usecases/
│ │ └── get_doctors.dart
│ ├── presentation/
│ │ ├── cubit/
│ │ │ └── doctor_cubit.dart
│ │ │ └── doctor_state.dart
│ │ ├── pages/
│ │ │ └── doctor_screen.dart
│ │ └── widgets/
│ │ └── doctor_card.dart
│ ├── di/
│ │ └── injection.dart
│ └── main.dart
├── pubspec.yaml
```

## 🏗️ Langkah Implementasi

1. **Setup Proyek**:
   - Membuat proyek Flutter dengan `flutter create medpoint_app`.
   - Menambahkan dependensi di `pubspec.yaml` seperti `supabase_flutter`, `flutter_bloc`, dan `get_it`.
   - Konfigurasi Supabase di `main.dart` dengan menggunakan URL dan API Key dari Supabase.

2. **Struktur Folder**:
   - **Data Layer**: Mengambil data dokter dari Supabase dan memetakan ke model `DoctorModel`.
   - **Domain Layer**: Menyediakan antarmuka untuk repository dan pengelolaan entitas `DoctorEntity`.
   - **Presentation Layer**: Menampilkan UI dokter menggunakan `BlocBuilder` untuk mengelola status loading, error, dan sukses.

3. **UI Design**:
   - Menggunakan `StatelessWidget` untuk `DoctorCard` yang menampilkan informasi dokter seperti nama, spesialisasi, dan foto.
   - Menggunakan `ListView.builder` untuk menampilkan daftar dokter dengan status loading dan error handling.

4. **State Management**:
   - Menggunakan `Cubit` untuk mengelola status data dokter (loading, sukses, error).
   - Menerapkan `BlocBuilder` untuk menampilkan UI sesuai dengan perubahan status.

5. **Dependency Injection**:
   - Menggunakan `get_it` untuk mengatur dan menyambungkan dependensi antar layer.

6. **Integrasi dengan Supabase**:
   - Mengambil data dokter dari Supabase menggunakan API dan menampilkan informasi di aplikasi.

## 🎥 Recording

[Link Demo Video](https://jam.dev/c/45c73c1c-a7f1-45f7-93d9-2bb5ee474392)

## ▶️ Cara Menjalankan
1. Clone repository ini.
2. Jalankan `flutter pub get` untuk mengunduh dependensi.
3. Jalankan aplikasi dengan `flutter run`.
-----------------------------------------------------------------------------------------------------------------------------------
# medpoint_app
A new Flutter project.
## Getting Started
This project is a starting point for a Flutter application.
A few resources to get you started if this is your first Flutter project:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

