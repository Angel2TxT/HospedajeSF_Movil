import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_application_1/models/materialM.dart';

part 'material_state.dart';
part 'material_event.dart';

class MaterialBloc extends Bloc<MaterialEvent, MaterialStatee> {
  MaterialBloc()
      : super(const MaterialStatee(
          errorCantidad: '',
          errorDescripcion: '',
          errorMarca: '',
          errorModelo: '',
          errorSerie: '',
          errorNumeroInventario: '',
          errorObservaciones: '',
          errorUbicacion: '',
          cantidad: '',
          descripcion: '',
          marca: '',
          modelo: '',
          serie: '',
          numeroInventario: '',
          observaciones: '',
          message: '',
          ubicacion: '',
        )) {
    on<MaterialInitialiceEvent>((event, emit) => emit(state.copyWith(
          errorCantidad: '',
          errorDescripcion: '',
          errorMarca: '',
          errorModelo: '',
          errorSerie: '',
          errorNumeroInventario: '',
          errorObservaciones: '',
          errorUbicacion: '',
          descripcion: '',
          cantidad: '',
          marca: '',
          modelo: '',
          serie: '',
          observaciones: '',
          numeroInventario: '',
          ubicacion: '',
        )));
    //Cantidad
    on<ErrorMaterialCantidadEvent>((event, emit) => emit(
          state.copyWith(errorCantidad: event.error),
        ));
    on<ErrorMaterialCantidadEmptyEvent>((event, emit) => emit(
          state.copyWith(errorCantidad: event.error),
        ));
    on<ErrorMaterialCantidadLenghtEvent>((event, emit) => emit(
          state.copyWith(errorCantidad: event.error),
        ));
    on<ValidoMaterialCantidadEvent>((event, emit) => emit(
          state.copyWith(errorCantidad: ''),
        ));
    //Descripcion
    on<ErrorMaterialDescripcionEmptyEvent>((event, emit) => emit(
          state.copyWith(errorDescripcion: event.error),
        ));
    on<ErrorMaterialDescripcionLenghtEvent>((event, emit) => emit(
          state.copyWith(errorDescripcion: event.error),
        ));
    on<ValidoMaterialDescripcionEvent>((event, emit) => emit(
          state.copyWith(errorDescripcion: ''),
        ));
    //Marca
    on<ErrorMaterialMarcaEmptyEvent>((event, emit) => emit(
          state.copyWith(errorMarca: event.error),
        ));
    on<ErrorMaterialMarcaLenghtEvent>((event, emit) => emit(
          state.copyWith(errorMarca: event.error),
        ));
    on<ValidoMaterialMarcaEvent>((event, emit) => emit(
          state.copyWith(errorMarca: ''),
        ));
    //Modelo
    on<ErrorMaterialModeloEmptyEvent>((event, emit) => emit(
          state.copyWith(errorModelo: event.error),
        ));
    on<ErrorMaterialModeloLenghtEvent>((event, emit) => emit(
          state.copyWith(errorModelo: event.error),
        ));
    on<ValidoMaterialModeloEvent>((event, emit) => emit(
          state.copyWith(errorModelo: ''),
        ));
    //Serie
    on<ErrorMaterialSerieEmptyEvent>((event, emit) => emit(
          state.copyWith(errorSerie: event.error),
        ));
    on<ErrorMaterialSerieLengthEvent>((event, emit) => emit(
          state.copyWith(errorSerie: event.error),
        ));
    on<ValidoMaterialSerieEvent>((event, emit) => emit(
          state.copyWith(errorSerie: ''),
        ));
    //Número de inventario
    on<ErrorMaterialNumeroInventarioEmptyEvent>((event, emit) => emit(
          state.copyWith(errorNumeroInventario: event.error),
        ));
    on<ErrorMaterialNumeroInventarioEvent>((event, emit) => emit(
          state.copyWith(errorNumeroInventario: event.error),
        ));
    on<ErrorMaterialNumeroInventarioLengthEvent>((event, emit) => emit(
          state.copyWith(errorNumeroInventario: event.error),
        ));
    on<ValidoMaterialNumeroInventarioEvent>((event, emit) => emit(
          state.copyWith(errorNumeroInventario: ''),
        ));
    //Observaciones
    on<ErrorMaterialObservacionesEmptyEvent>((event, emit) => emit(
          state.copyWith(errorObservaciones: event.error),
        ));
    on<ErrorMaterialObservacionesLengthEvent>((event, emit) => emit(
          state.copyWith(errorObservaciones: event.error),
        ));
    on<ValidoMaterialObservacionesEvent>((event, emit) => emit(
          state.copyWith(errorObservaciones: ''),
        ));
    //Modelo
    on<ErrorMaterialUbicacionEmptyEvent>((event, emit) => emit(
          state.copyWith(errorUbicacion: event.error),
        ));
    on<ErrorMaterialUbicacionLenghtEvent>((event, emit) => emit(
          state.copyWith(errorUbicacion: event.error),
        ));
    on<ValidoMaterialUbicacionEvent>((event, emit) => emit(
          state.copyWith(errorUbicacion: ''),
        ));

    //Estado de las cajitas de texto
    on<MaterialCantidadEvent>((event, emit) => emit(
          state.copyWith(cantidad: event.cantidad),
        ));
    on<MaterialDescripcionEvent>((event, emit) => emit(
          state.copyWith(descripcion: event.descripcion),
        ));
    on<MaterialMarcaEvent>((event, emit) => emit(
          state.copyWith(marca: event.marca),
        ));
    on<MaterialModeloEvent>((event, emit) => emit(
          state.copyWith(modelo: event.modelo),
        ));
    on<MaterialSerieEvent>((event, emit) => emit(
          state.copyWith(serie: event.serie),
        ));
    on<MaterialNumeroInventarioEvent>((event, emit) => emit(
          state.copyWith(numeroInventario: event.numeroInventario),
        ));
    on<MaterialObservacionesEvent>((event, emit) => emit(
          state.copyWith(observaciones: event.observaciones),
        ));
    on<MaterialUbicacionEvent>((event, emit) => emit(
          state.copyWith(ubicacion: event.ubicacion),
        ));
    //Mensage
    on<MaterialMessageEvent>((event, emti) => emit(
          state.copyWith(message: event.message),
        ));
  }
}
