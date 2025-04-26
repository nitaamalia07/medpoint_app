import 'package:medpoint_app/data/datasources/doctor_service.dart';

class DoctorRepositoryImpl {
  final DoctorService doctorService;

  DoctorRepositoryImpl(this.doctorService);

  Future<List<Doctor>> getDoctors() async {
    return await doctorService.getAllDoctors();
  }
}
