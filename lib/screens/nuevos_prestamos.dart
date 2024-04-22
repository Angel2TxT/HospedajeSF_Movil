import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bloc/authentication/authentication_bloc.dart';
// import '../bloc/historial/historial_bloc.dart';
import '../bloc/prestamos/prestamos_bloc.dart';
import '../repositories/historial_repository.dart';
import '../widgets/drawerAdmin.dart';

class NuevosPedidos extends StatelessWidget {
  const NuevosPedidos({super.key});

  @override
  Widget build(BuildContext context) {
    HistorialRepositoryAdmin _repositoryAdmin = HistorialRepositoryAdmin();
    // HistorialBloc historialBloc = BlocProvider.of<HistorialBloc>(
    //   context,
    //   listen: false,
    // );
    PrestamosBloc prestamosBloc = BlocProvider.of<PrestamosBloc>(
      context,
      listen: false,
    );
    AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: false,
    );
    AuthenticationAdmin stateUser =
        authenticationBloc.state as AuthenticationAdmin;

    prestamosBloc.add(const PrestamosInitializeEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevos prestamos'),
      ),
      drawer: const MiDrawerAdmin(),
      body: BlocBuilder<PrestamosBloc, PrestamosState>(builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.listaNuevos.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ID Pedido:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.listaNuevos[index].id}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Nombre:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaNuevos[index].name),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Correo:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaNuevos[index].email),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Fecha de salida:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.listaNuevos[index].fechaSalida)
                              Text(
                                DateFormat.yMMMEd().format(DateTime.parse(
                                    state.listaNuevos[index].fechaSalida)),
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Fecha de entrega:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.listaNuevos[index].fechaEntrega),
                              Text(
                                DateFormat.yMMMEd().format(DateTime.parse(
                                    state.listaNuevos[index].fechaEntrega)),
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Estado:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaNuevos[index].status),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Material:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaNuevos[index].material),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cantidad:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.listaNuevos[index].cantidad}')
                            ],
                          ),
                          // Text(
                          //   'Id del pedido ${state.listaNuevos[index].id.toString()}',
                          // ),
                          // Text(
                          //   'Nombre ${state.listaNuevos[index].name.toString()}',
                          // ),
                          // Text(
                          //   'Correo ${state.listaNuevos[index].email.toString()}',
                          // ),
                          // Text(
                          //   'Salida: ${state.listaNuevos[index].fechaSalida.toString()}',
                          // ),
                          // Text(
                          //   'Devolución: ${state.listaNuevos[index].fechaEntrega.toString()}',
                          // ),
                          // Text(
                          //   'Estado: ${state.listaNuevos[index].status.toString()}',
                          // ),
                          // Text(
                          //   'Material prestado: ${state.listaNuevos[index].material.toString()}',
                          // ),
                          // Text(
                          //   'Cantidad: ${state.listaNuevos[index].cantidad.toString()}',
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _repositoryAdmin.aceptarPrestamo(
                                        state.listaNuevos[index]);

                                    prestamosBloc.add(PrestamosDeleteEvent(
                                        item: state.listaNuevos[index]));

                                    // prestamosBloc
                                    //     .add(const PrestamosInitializeEvent());

                                    Navigator.pushNamed(context, 'nuevos');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Aceptar',
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _repositoryAdmin.rechazarPrestamo(
                                        state.listaNuevos[index]);

                                    prestamosBloc.add(PrestamosDeleteEvent(
                                        item: state.listaNuevos[index]));

                                    // prestamosBloc
                                    //     .add(const PrestamosInitializeEvent());

                                    Navigator.pushNamed(context, 'nuevos');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Rechazar',
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
