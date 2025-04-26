import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpoint_app/presentation/cubit/doctor_cubit.dart';
import 'package:medpoint_app/widgets/doctor_card.dart';
import 'package:medpoint_app/presentation/cubit/doctor_state.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DoctorCubit>().fetchDoctors();

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is DoctorLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DoctorLoaded) {
            final doctors = state.doctors;
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Gambar manual dari assets

                  // Teks judul
                  Text(
                    'Daftar Dokter',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  // List dokter
                  ListView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // biar scroll di parent
                    shrinkWrap: true,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return DoctorCard(
                        name: doctor.name,
                        specialization: doctor.specialization,
                        imageUrl: _getImageNameByDoctorName(doctor.name),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is DoctorError) {
            return Center(
              child: Text('Failed to load doctors: ${state.message}'),
            );
          }
          return Center(child: Text('No doctors available'));
        },
      ),
    );
  }
}

// Fungsi untuk mendapatkan nama file gambar berdasarkan nama dokter
String _getImageNameByDoctorName(String name) {
  switch (name) {
    case 'dr. Juna':
      return 'dr. Juna.jpg';
    case 'dr. Kastini':
      return 'dr. Kastini.jpg';
    case 'dr. Sita':
      return 'dr. Sita.jpg';
    case 'dr. Siti':
      return 'dr. Siti.jpg';
    case 'dr. Solkan':
      return 'dr. Solkan.jpg';
    default:
      return 'default.jpg'; // fallback image
  }
}
