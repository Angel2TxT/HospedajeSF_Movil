import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/floor_model.dart';
import '../../repositories/admin_repository.dart';

part 'floors_event.dart';
part 'floors_state.dart';

class FloorsBloc extends Bloc<FloorsEvent, FloorsState> {
  final AdminRepository _adminRepository;

  FloorsBloc(this._adminRepository)
      : super(const FloorsState(
          floorsList: [],
        )) {
    on<FloorsGetAllEvent>((event, emit) async {
        List<FloorModel> list = await _adminRepository.getAllFloors();
      emit(FloorsState(floorsList: list));
    });
  }
}
