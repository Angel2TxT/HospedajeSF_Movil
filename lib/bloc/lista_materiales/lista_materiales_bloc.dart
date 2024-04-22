import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/material_model.dart';
import '../../repositories/historial_repository.dart';

part 'lista_materiales_event.dart';
part 'lista_materiales_state.dart';

class ListaMaterialesBloc
    extends Bloc<ListaMaterialesEvent, ListaMaterialesState> {
  final HistorialRepositoryAdmin _historialRepositoryAdmin;

  ListaMaterialesBloc(this._historialRepositoryAdmin)
      : super(const ListaMaterialesState(listaMaterial: [])) {
    on<ListaMaterialesInitialiceEvent>((event, emit) async {
      List<MaterialM> lista = await _historialRepositoryAdmin.allMaterial();
      emit(ListaMaterialesState(listaMaterial: lista));
    });
  }
}
