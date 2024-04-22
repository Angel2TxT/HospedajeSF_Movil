part of 'material_bloc.dart';

abstract class MaterialEvent extends Equatable {
  const MaterialEvent();

  @override
  List<Object> get props => [];
}

class MaterialInitialiceEvent extends MaterialEvent {
  const MaterialInitialiceEvent();
}

//Cantidad
class ErrorMaterialCantidadEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialCantidadEvent(this.error);
}

class ErrorMaterialCantidadEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialCantidadEmptyEvent(this.error);
}

class ErrorMaterialCantidadLenghtEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialCantidadLenghtEvent(this.error);
}

class ValidoMaterialCantidadEvent extends MaterialEvent {
  const ValidoMaterialCantidadEvent();
}

//Descripcion
class ErrorMaterialDescripcionEmptyEvent extends MaterialEvent {
  final String error;
  const ErrorMaterialDescripcionEmptyEvent(this.error);
}

class ErrorMaterialDescripcionLenghtEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialDescripcionLenghtEvent(this.error);
}

class ValidoMaterialDescripcionEvent extends MaterialEvent {
  const ValidoMaterialDescripcionEvent();
}

//Marca
class ErrorMaterialMarcaEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialMarcaEmptyEvent(this.error);
}

class ErrorMaterialMarcaLenghtEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialMarcaLenghtEvent(this.error);
}

class ValidoMaterialMarcaEvent extends MaterialEvent {
  const ValidoMaterialMarcaEvent();
}

//Modelo
class ErrorMaterialModeloEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialModeloEmptyEvent(this.error);
}

class ErrorMaterialModeloLenghtEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialModeloLenghtEvent(this.error);
}

class ValidoMaterialModeloEvent extends MaterialEvent {
  const ValidoMaterialModeloEvent();
}

//Serie
class ErrorMaterialSerieEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialSerieEmptyEvent(this.error);
}

class ErrorMaterialSerieLengthEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialSerieLengthEvent(this.error);
}

class ValidoMaterialSerieEvent extends MaterialEvent {
  const ValidoMaterialSerieEvent();
}

//Numero de inventario
class ErrorMaterialNumeroInventarioEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialNumeroInventarioEmptyEvent(this.error);
}

class ErrorMaterialNumeroInventarioEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialNumeroInventarioEvent(this.error);
}

class ErrorMaterialNumeroInventarioLengthEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialNumeroInventarioLengthEvent(this.error);
}

class ValidoMaterialNumeroInventarioEvent extends MaterialEvent {
  const ValidoMaterialNumeroInventarioEvent();
}

//Observar
class ErrorMaterialObservacionesEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialObservacionesEmptyEvent(this.error);
}

class ErrorMaterialObservacionesLengthEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialObservacionesLengthEvent(this.error);
}

class ValidoMaterialObservacionesEvent extends MaterialEvent {
  const ValidoMaterialObservacionesEvent();
}

//ubicacion
class ErrorMaterialUbicacionEmptyEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialUbicacionEmptyEvent(this.error);
}

class ErrorMaterialUbicacionLenghtEvent extends MaterialEvent {
  final String error;

  const ErrorMaterialUbicacionLenghtEvent(this.error);
}

class ValidoMaterialUbicacionEvent extends MaterialEvent {
  const ValidoMaterialUbicacionEvent();
}

//Estados de las cajitas de texto
class MaterialCantidadEvent extends MaterialEvent {
  final String cantidad;
  const MaterialCantidadEvent(this.cantidad);
}

class MaterialDescripcionEvent extends MaterialEvent {
  final String descripcion;
  const MaterialDescripcionEvent(this.descripcion);
}

class MaterialMarcaEvent extends MaterialEvent {
  final String marca;
  const MaterialMarcaEvent(this.marca);
}

class MaterialModeloEvent extends MaterialEvent {
  final String modelo;
  const MaterialModeloEvent(this.modelo);
}

class MaterialSerieEvent extends MaterialEvent {
  final String serie;
  const MaterialSerieEvent(this.serie);
}

class MaterialNumeroInventarioEvent extends MaterialEvent {
  final String numeroInventario;
  const MaterialNumeroInventarioEvent(this.numeroInventario);
}

class MaterialObservacionesEvent extends MaterialEvent {
  final String observaciones;
  const MaterialObservacionesEvent(this.observaciones);
}

class MaterialUbicacionEvent extends MaterialEvent {
  final String ubicacion;
  const MaterialUbicacionEvent(this.ubicacion);
}

//Mensage
class MaterialMessageEvent extends MaterialEvent {
  final String message;

  const MaterialMessageEvent(this.message);
}
