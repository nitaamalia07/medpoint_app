import 'package:medpoint_app/data/datasources/doctor_service.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<Doctor> doctors;

  DoctorLoaded(this.doctors);
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError(this.message);
}
