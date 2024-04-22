import 'package:flutter/material.dart';
// import 'package:flutter_application_6/repositories/historial_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../blocs/lista_material/lista_material_bloc.dart';
// import '../blocs/material/material_bloc.dart';
// import '../blocs/materiales/materiales_bloc.dart';
// import '../blocs/user/user_bloc.dart';
// import '../models/materialM.dart';
// import '../providers/db_provider.dart';
import '../bloc/material/material_bloc.dart';
import '../models/material_model.dart';
import '../repositories/historial_repository.dart';
import '../utils/validador.dart';

class MaterialController {
  final BuildContext context;
  // late final UserBloc userBloc;

  late final MaterialBloc materialBloc;
  // late final HistorialRepositoryAdmin historialRepositoryAdmin;
  HistorialRepositoryAdmin historialRepositoryAdmin =
      HistorialRepositoryAdmin();
  // late final MaterialesBloc materialesBloc;
  // late final ListaMaterialBloc listaMaterialBloc;

  final Map<String, dynamic> formValues = {
    'cantidad': '',
    'descripcion': '',
    'marca': '',
    'modelo': '',
    'serie': '',
    'numeroinventario': '',
    'observaciones': '',
  };

  MaterialController({
    required this.context,
  }) {
    // userBloc = BlocProvider.of<UserBloc>(
    //   context,
    //   listen: false,
    // );
    // materialesBloc = BlocProvider.of<MaterialesBloc>(
    //   context,
    //   listen: false,
    // );
    materialBloc = BlocProvider.of<MaterialBloc>(
      context,
      listen: false,
    );
  }

  String? validarCantidad(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialCantidadEmptyEvent(
          'Este campo no puede quedar vacío'));
    } else if (!Validate(value).isNum()) {
      materialBloc
          .add(const ErrorMaterialCantidadEvent('No se aceptan letras'));
    } else if (value.length > 5) {
      materialBloc.add(const ErrorMaterialCantidadLenghtEvent(
          'Invalido, la cantidad excede los 5 dígitos'));
    } else {
      materialBloc.add(const ValidoMaterialCantidadEvent());
    }
    return null;
  }

  String? validarDescripcion(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialDescripcionEmptyEvent(
          'Este campo no puede quedar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialDescripcionLenghtEvent(
          'Debe ser menor a 50 caracteres'));
    } else {
      materialBloc.add(const ValidoMaterialDescripcionEvent());
    }
    return null;
  }

  String? validarMarca(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialMarcaEmptyEvent(
          'Este campo no puede quedar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialMarcaLenghtEvent(
          'Debe ser menor a 50 caracteres'));
    } else {
      materialBloc.add(const ValidoMaterialMarcaEvent());
    }
    return null;
  }

  String? validarModelo(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialModeloEmptyEvent(
          'Este campo no puede quedar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialModeloLenghtEvent(
          'Debe ser menor a 50 caracteres'));
    } else {
      materialBloc.add(const ValidoMaterialModeloEvent());
    }
    return null;
  }

  String? validarSerie(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialSerieEmptyEvent(
          'Este campo no debe quedar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialSerieLengthEvent(
          'Debe ser menor a 50 caracteres'));
    } else {
      materialBloc.add(const ValidoMaterialSerieEvent());
    }
    return null;
  }

  String? validarNumeroInventario(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialNumeroInventarioEmptyEvent(
          'Este campo no debe quedar vacío'));
    } else if (!Validate(value).isNum()) {
      materialBloc.add(
          const ErrorMaterialNumeroInventarioEvent('No se aceptan letras'));
    } else if ((value.length) > 5) {
      materialBloc.add(const ErrorMaterialNumeroInventarioLengthEvent(
          'Debe ser menor a 5 dígitos'));
    } else {
      materialBloc.add(const ValidoMaterialNumeroInventarioEvent());
    }
    return null;
  }

  String? validarObservaciones(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialObservacionesEmptyEvent(
          'Este campo no debe estar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialObservacionesLengthEvent(
          'Debe ser menor a 50 carecteres'));
    } else {
      materialBloc.add(const ValidoMaterialObservacionesEvent());
    }
    return null;
  }

  String? validarUbicacion(String? value) {
    if (value!.isEmpty) {
      materialBloc.add(const ErrorMaterialUbicacionEmptyEvent(
          'Este campo no puede quedar vacío'));
    } else if ((value.length) > 50) {
      materialBloc.add(const ErrorMaterialUbicacionLenghtEvent(
          'Debe ser menor a 50 caracteres'));
    } else {
      materialBloc.add(const ValidoMaterialUbicacionEvent());
    }
    return null;
  }

  void cantidad(String? value) {
    materialBloc.add(MaterialCantidadEvent(value ?? ''));
  }

  void descripcion(String? value) {
    materialBloc.add(MaterialDescripcionEvent(value ?? ''));
  }

  void marca(String? value) {
    materialBloc.add(MaterialMarcaEvent(value ?? ''));
  }

  void modelo(String? value) {
    materialBloc.add(MaterialModeloEvent(value ?? ''));
  }

  void serie(String? value) {
    materialBloc.add(MaterialSerieEvent(value ?? ''));
  }

  void numeroInventario(String? value) {
    materialBloc.add(MaterialNumeroInventarioEvent(value ?? ''));
  }

  void observaciones(String? value) {
    materialBloc.add(MaterialObservacionesEvent(value ?? ''));
  }

  void ubicacion(String? value) {
    materialBloc.add(MaterialUbicacionEvent(value ?? ''));
  }

  bool botonActivo() {
    return materialBloc.state.errorCantidad == '' &&
        materialBloc.state.errorDescripcion == '' &&
        materialBloc.state.errorMarca == '' &&
        materialBloc.state.errorModelo == '' &&
        materialBloc.state.errorSerie == '' &&
        materialBloc.state.errorNumeroInventario == '' &&
        materialBloc.state.errorObservaciones == '' &&
        materialBloc.state.errorUbicacion == '' &&
        materialBloc.state.cantidad != '' &&
        materialBloc.state.descripcion != '' &&
        materialBloc.state.marca != '' &&
        materialBloc.state.modelo != '' &&
        materialBloc.state.serie != '' &&
        materialBloc.state.numeroInventario != '' &&
        materialBloc.state.observaciones != '' &&
        materialBloc.state.ubicacion != '';
  }

  addMaterial() async {
    MaterialM material = MaterialM(
      nombre: materialBloc.state.descripcion,
      cantidad: int.parse(materialBloc.state.cantidad),
      marca: materialBloc.state.marca,
      modelo: materialBloc.state.modelo,
      serie: materialBloc.state.serie,
      observaciones: materialBloc.state.observaciones,
      nInventario: int.parse(materialBloc.state.numeroInventario),
      ubicacion: materialBloc.state.numeroInventario,
    );

    historialRepositoryAdmin.addNewMaterial(material);
    Navigator.popAndPushNamed(context, 'registrar_materiales');
    materialBloc.add(
        const MaterialMessageEvent('El producto fue agregado correctamente'));
    materialBloc.add(const MaterialInitialiceEvent());
  }
}
