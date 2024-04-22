import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/prestamo.dart';
import '../../repositories/historial_repository.dart';
// import 'package:flutter_application_5/models/prestamo.dart';
// import 'package:flutter_application_5/repositories/historial_repository.dart';

// import '../../models/historial_model.dart';

part 'prestamos_state.dart';
part 'prestamos_event.dart';

class PrestamosBloc extends Bloc<PrestamosEvent, PrestamosState> {
  final HistorialRepositoryAdmin _historialRepositoryAdmin;

  PrestamosBloc(this._historialRepositoryAdmin)
      : super(const PrestamosState(listaNuevos: [])) {
    on<PrestamosInitializeEvent>((event, emit) async {
      List<PrestamoModel> lista =
          await _historialRepositoryAdmin.newPrestamos();
      emit(PrestamosState(listaNuevos: lista));
    });
    on<PrestamosCleanEvent>(
      (event, emit) => emit(const PrestamosState(listaNuevos: [])),
    );
    on<PrestamosDeleteEvent>(
      (event, emit) => emit(state.removeItem(event.item)),
    );
    //Admin
    on<HistorialInitializeAdminEvent>((event, emit) async {
      List<PrestamoModel> lista =
          await _historialRepositoryAdmin.findHistorialAdmin();
      emit(PrestamosState(listaNuevos: lista));
    });
  }
}
