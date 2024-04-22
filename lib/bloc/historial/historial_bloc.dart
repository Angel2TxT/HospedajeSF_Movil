import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/historial_model.dart';
import '../../repositories/historial_repository.dart';

part 'historial_event.dart';
part 'historial_state.dart';

class HistorialBloc extends Bloc<HistorialEvent, HistorialState> {
  final HistorialRepository _historialRepository;
  final HistorialRepositoryAdmin _historialRepositoryAdmin;

  HistorialBloc(this._historialRepository, this._historialRepositoryAdmin)
      : super(const HistorialState(
          lstHistorial: [],
          // ))

          // HistorialBloc()
          //     : super(HistorialState(
          //         lstHistorial: [
          //           HistorialModel(
          //             id: 1,
          //             fecha: '12-02-23',
          //             status: 'cancelado',
          //             lstLibros: ['libro1', 'libro2'],
          //           ),
          //           HistorialModel(
          //             id: 1,
          //             fecha: '12-02-23',
          //             status: 'cancelado',
          //             lstLibros: ['libro1', 'libro2'],
          //           ),
          //         ],
        )) {
    on<HistorialInitializeEvent>((event, emit) async {
      List<HistorialModel> lista =
          await _historialRepository.findHistorial(event.email);
      emit(HistorialState(lstHistorial: lista));
    });
    // on<HistorialInitializeEvent>(
    //     (event, emit) => emit(const HistorialState(lstHistorial: [])));
    on<HistorialAddEvent>((event, emit) => emit(state.add(event.item)));
    on<HistorialCleanEvent>(
        (event, emit) => emit(const HistorialState(lstHistorial: [])));
  }
}
