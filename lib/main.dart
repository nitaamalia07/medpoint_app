import 'package:flutter/material.dart';
import 'package:medpoint_app/data/datasources/doctor_service.dart';
import 'package:medpoint_app/data/repositories/doctor_repository_impl.dart';
import 'package:medpoint_app/presentation/cubit/doctor_cubit.dart';
import 'package:medpoint_app/presentation/pages/doctor_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // Inisialisasi Supabase
  await Supabase.initialize(
    url: 'https://eylvbwzcbnqpapumtfdj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5bHZid3pjYm5xcGFwdW10ZmRqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQxMTg5NDcsImV4cCI6MjA1OTY5NDk0N30.Jlz5TzTl_OH4s5jw8Kd6OOYdfq6OqtEXN0V_1U-Z32c',
  );

  // Setup dependency injection menggunakan get_it
  final getIt = GetIt.instance;

  // Daftarkan semua dependency yang dibutuhkan
  getIt.registerLazySingleton<DoctorService>(() => DoctorService());
  getIt.registerLazySingleton<DoctorRepositoryImpl>(
    () => DoctorRepositoryImpl(getIt<DoctorService>()),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medpoint App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DoctorCubit>(
            create:
                (context) =>
                    DoctorCubit(GetIt.instance<DoctorRepositoryImpl>()),
          ),
        ],
        child: DoctorScreen(),
      ),
    );
  }
}
