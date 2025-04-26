import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpoint_app/data/repositories/doctor_repository_impl.dart';
import 'package:medpoint_app/presentation/cubit/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepositoryImpl doctorRepository;

  DoctorCubit(this.doctorRepository) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorLoading());
      final doctors = await doctorRepository.getDoctors();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError('Failed to load doctors: ${e.toString()}'));
    }
  }
}
