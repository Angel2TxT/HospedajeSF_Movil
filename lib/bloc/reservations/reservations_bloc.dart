// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bedroom_model.dart';
import '../../models/reservation.dart';
import '../../repositories/admin_repository.dart';
import '../../repositories/client_repository.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationEvent, ReservationsState> {
  final ClientRepository _clientRepository;
  final AdminRepository _adminRepository;
  // bool initialized = false;
  
  ReservationsBloc(this._clientRepository, this._adminRepository)
  : super(const ReservationsState(
    reservationsList: [],
  )) {

    on<ReservationsGetAllEvent>((event, emit) async {
      List<ReservationModel> list = [];
      try {
      list = await _adminRepository.getReservations();
      } catch (e) {
        print("----------------Error query-----------------");
      }      
      emit(ReservationsState(reservationsList: list));
    } );
  }
}