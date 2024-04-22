import 'package:flutter/material.dart';
// import 'package:flutter_application_5/widgets/drawerAdmin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

import '../bloc/authentication/authentication_bloc.dart';
// import '../bloc/historial/historial_bloc.dart';
import '../bloc/lista_materiales/lista_materiales_bloc.dart';
// import '../bloc/prestamos/prestamos_bloc.dart';
import '../widgets/drawerAdmin.dart';

class Materiales extends StatelessWidget {
  const Materiales({super.key});

  @override
  Widget build(BuildContext context) {
    ListaMaterialesBloc listaMaterialesBloc =
        BlocProvider.of<ListaMaterialesBloc>(
      context,
      listen: false,
    );
    AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: false,
    );
    AuthenticationAdmin stateUser =
        authenticationBloc.state as AuthenticationAdmin;

    listaMaterialesBloc.add(const ListaMaterialesInitialiceEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materiales'),

        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.abc),
        //     onPressed: () {
        //       //
        //     },
        //   ),
        // ],
      ),
      drawer: const MiDrawerAdmin(),
      body: BlocBuilder<ListaMaterialesBloc, ListaMaterialesState>(
          builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              // Card(
              //   child: ListTile(
              //     title: Text('15-08-2023'),
              //     subtitle: Text('Pendiente por recoger'),
              //     leading: Icon(Icons.task),
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.listaMaterial.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),

                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Descripción:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaMaterial[index].nombre),
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
                              Text('${state.listaMaterial[index].cantidad}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Marca:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaMaterial[index].marca),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Modelo:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.listaNuevos[index].fechaSalida)
                              Text(state.listaMaterial[index].modelo),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Serie:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.listaNuevos[index].fechaEntrega),
                              Text(state.listaMaterial[index].serie),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'observaciones:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaMaterial[index].observaciones),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'No. inventario:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.listaMaterial[index].nInventario}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Ubicación:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.listaMaterial[index].ubicacion),
                            ],
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     const Text(
                          //       'Cantidad:',
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     Text('${state.listaNuevos[index].cantidad}')
                          //   ],
                          // ),
                          // Text(
                          //   'Id del pedido ${state.listaNuevos[index].id.toString()}',
                          // ),
                          // Text(
                          //   'Id del pedido ${state.listaNuevos[index].name.toString()}',
                          // ),
                          // Text(
                          //   'Id del pedido ${state.listaNuevos[index].email.toString()}',
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
                        ],
                      ),
                    ),

                    // child: ListTile(
                    //   title: Text('15-08-2023'),
                    //   subtitle: Text('pendiente por recoger'),
                    //   leading: Icon(Icons.task),
                    // ),
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
