// import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/bedroom_model.dart';
import '../../repositories/admin_repository.dart';
import '../../repositories/client_repository.dart';

part 'bedroom_event.dart';
part 'bedroom_state.dart';

class BedroomBloc extends Bloc<BedroomEvent, BedroomState> {
  final ClientRepository _clientRepository;
  final AdminRepository _adminRepository;
  // bool initialized = false;
  
  BedroomBloc(this._clientRepository, this._adminRepository)
  : super( BedroomState(
    bedroom: BedroomsModel(
        id: 0, 
        num: "0", 
        occupants:  1, 
        maxOccupants: 1, 
        floor: 1, 
        state: "nada", 
        url: "nada",
        ),
  )) {
    on<BedroomsGetEvent>((event, emit) async {
      BedroomsModel bedroom = await _adminRepository.getBedroom(event.id);    
      emit(BedroomState(bedroom: bedroom));
      print("Error.......");
    } );
  }
}