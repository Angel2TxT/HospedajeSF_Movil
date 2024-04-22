// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bedroom_model.dart';
import '../../repositories/admin_repository.dart';
import '../../repositories/client_repository.dart';

part 'bedrooms_event.dart';
part 'bedrooms_state.dart';

class BedroomsBloc extends Bloc<BedroomsEvent, BedroomsState> {
  final ClientRepository _clientRepository;
  final AdminRepository _adminRepository;
  
  BedroomsBloc(this._clientRepository, this._adminRepository)
  : super(const BedroomsState(
    bedroomsList: [],
  )) {
    on<BedroomsGetAllEvent>((event, emit) async {
      List<BedroomsModel> list = [];
      try {
      list = await _clientRepository.rGetAllBedrooms();
      } catch (e) {
      list.add(
        BedroomsModel(
          id: 1,
          num: "Error al consultar los datos",
          occupants: 1,
          maxOccupants: 1,
          floor: 1,
          state: "a",
          url: "h",
        ));
      }      
      emit(BedroomsState(bedroomsList: list));
    } );
    on<BedroomsGetForIdEvent>((event, emit) async {
      List<BedroomsModel> list = [];
      list = await _adminRepository.getBedroomsById(event.id);
      emit(BedroomsState(bedroomsList: list));
    });
  }
}