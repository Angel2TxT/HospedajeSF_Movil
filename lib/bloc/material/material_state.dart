part of 'material_bloc.dart';

class MaterialStatee extends Equatable {
  final String errorCantidad;
  final String errorDescripcion;
  final String errorMarca;
  final String errorModelo;
  final String errorSerie;
  final String errorNumeroInventario;
  final String errorObservaciones;
  final String errorUbicacion;

  final String cantidad;
  final String descripcion;
  final String marca;
  final String modelo;
  final String serie;
  final String numeroInventario;
  final String observaciones;
  final String ubicacion;

  final String message;

  const MaterialStatee({
    required this.errorCantidad,
    required this.errorDescripcion,
    required this.errorMarca,
    required this.errorModelo,
    required this.errorSerie,
    required this.errorNumeroInventario,
    required this.errorObservaciones,
    required this.errorUbicacion,
    required this.cantidad,
    required this.descripcion,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.numeroInventario,
    required this.observaciones,
    required this.message,
    required this.ubicacion,
  });

  MaterialStatee copyWith({
    String? errorCantidad,
    String? errorDescripcion,
    String? errorMarca,
    String? errorModelo,
    String? errorSerie,
    String? errorNumeroInventario,
    String? errorObservaciones,
    String? errorUbicacion,
    String? cantidad,
    String? descripcion,
    String? marca,
    String? modelo,
    String? serie,
    String? numeroInventario,
    String? observaciones,
    String? message,
    String? ubicacion,
  }) =>
      MaterialStatee(
        errorCantidad: errorCantidad ?? this.errorCantidad,
        errorDescripcion: errorDescripcion ?? this.errorDescripcion,
        errorMarca: errorMarca ?? this.errorMarca,
        errorModelo: errorModelo ?? this.errorModelo,
        errorSerie: errorSerie ?? this.errorSerie,
        errorNumeroInventario:
            errorNumeroInventario ?? this.errorNumeroInventario,
        errorObservaciones: errorObservaciones ?? this.errorObservaciones,
        errorUbicacion: errorUbicacion ?? this.errorUbicacion,
        cantidad: cantidad ?? this.cantidad,
        descripcion: descripcion ?? this.descripcion,
        marca: marca ?? this.marca,
        modelo: modelo ?? this.modelo,
        serie: serie ?? this.serie,
        numeroInventario: numeroInventario ?? this.numeroInventario,
        observaciones: observaciones ?? this.observaciones,
        ubicacion: ubicacion ?? this.ubicacion,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        errorCantidad,
        errorDescripcion,
        errorMarca,
        errorModelo,
        errorSerie,
        errorNumeroInventario,
        errorObservaciones,
        errorUbicacion,
        cantidad,
        descripcion,
        marca,
        modelo,
        serie,
        numeroInventario,
        observaciones,
        message,
        ubicacion,
      ];
}
