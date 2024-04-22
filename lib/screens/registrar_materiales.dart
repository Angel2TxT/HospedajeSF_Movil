import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/material/material_bloc.dart';
import '../controllers/material_controller.dart';
import '../widgets/drawerAdmin.dart';

class RegistrarMaterial extends StatelessWidget {
  const RegistrarMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialController controller = MaterialController(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar materiales'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.exit_to_app),
        //     tooltip: 'Salir',
        //     onPressed: () {
        //       AuthenticationBloc authenticationBloc =
        //           BlocProvider.of<AuthenticationBloc>(
        //         context,
        //         listen: false,
        //       );
        //       authenticationBloc.add(AuthenticationSignOut());
        //     },
        //   ),
        // ],
      ),
      drawer: const MiDrawerAdmin(),
      body: BlocBuilder<MaterialBloc, MaterialStatee>(builder: (_, state) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.descripcion(value);
                    controller.validarDescripcion(value);
                  },
                  decoration: InputDecoration(
                    errorText: state.errorDescripcion == ''
                        ? null
                        : state.errorDescripcion,
                    labelText: 'Descripción',
                    hintText: 'Mesas',
                    icon: const Icon(Icons.laptop),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.cantidad(value);
                    controller.validarCantidad(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                    hintText: '12',
                    errorText:
                        state.errorCantidad == '' ? null : state.errorCantidad,
                    icon: const Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.marca(value);
                    controller.validarMarca(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Marca',
                    hintText: 'SVJ23',
                    errorText: state.errorMarca == '' ? null : state.errorMarca,
                    icon: const Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.modelo(value);
                    controller.validarModelo(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Modelo',
                    hintText: 'h2023',
                    errorText:
                        state.errorModelo == '' ? null : state.errorModelo,
                    icon: const Icon(Icons.code_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.serie(value);
                    controller.validarSerie(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Serie',
                    hintText: '23JKDK534',
                    errorText: state.errorSerie == '' ? null : state.errorSerie,
                    icon: const Icon(Icons.code),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.observaciones(value);
                    controller.validarObservaciones(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Observaciones',
                    hintText: 'Cargador falla',
                    errorText: state.errorObservaciones == ''
                        ? null
                        : state.errorObservaciones,
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.numeroInventario(value);
                    controller.validarNumeroInventario(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'No. inventario',
                    hintText: '1',
                    errorText: state.errorNumeroInventario == ''
                        ? null
                        : state.errorNumeroInventario,
                    icon: const Icon(Icons.numbers_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.ubicacion(value);
                    controller.validarUbicacion(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Ubicación',
                    hintText: 'Edificio I',
                    errorText: state.errorUbicacion == ''
                        ? null
                        : state.errorUbicacion,
                    icon: const Icon(Icons.laptop),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: !controller.botonActivo()
                      ? null
                      : () => controller.addMaterial(),
                  child: const Text(
                    'Registrar',
                    // style: GoogleFonts.raleway(
                    //   color: Colors.white,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
