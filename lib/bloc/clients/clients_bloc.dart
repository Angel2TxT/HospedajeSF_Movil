import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/client_model.dart';
// import '../../models/floor_model.dart';
import '../../repositories/admin_repository.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final AdminRepository _adminRepository;

  ClientsBloc(this._adminRepository)
      : super(const ClientsState(
          clientsList: [],
        )) {
    on<ClientsGetAllEvent>((event, emit) async {
        List<ClientModel> list = await _adminRepository.getAllClient();
      emit(ClientsState(clientsList: list));
    });
  }
}
