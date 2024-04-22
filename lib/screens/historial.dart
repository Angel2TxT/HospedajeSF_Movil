import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/historial/historial_bloc.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    HistorialBloc historialBloc = BlocProvider.of<HistorialBloc>(
      context,
      listen: false,
    );
    AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: false,
    );
    AuthenticationUser stateUser =
        authenticationBloc.state as AuthenticationUser;
    historialBloc.add(HistorialInitializeEvent(email: stateUser.email));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        // centerTitle: true,
        // leading: const CircleAvatar(
        //   // backgroundColor: Color(0xff00516d),
        //   // backgroundColor: Colors.white,

        //   // child: Text(
        //   //   'F',
        //   //   style: TextStyle(
        //   //       fontSize: 25, fontWeight: FontWeight.bold),
        //   // ),
        //   // backgroundImage: AssetImage("assets/img/user2.png"),
        //   backgroundImage: AssetImage("assets/img/icono.png"),
        //   // child: Image.asset(
        //   //   "assets/img/user2.png",
        //   // height: 50,
        //   // width: 50,
        //   // ),
        // ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.abc),
        //     onPressed: () {
        //       //
        //     },
        //   ),
        // ],
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
        //       Navigator.of(context).pushNamedAndRemoveUntil(
        //           'blocNavigate', (Route<dynamic> route) => false);
        //     },
        //   ),
        // ],
      ),
      drawer: const MiDrawer(),
      body: BlocBuilder<HistorialBloc, HistorialState>(builder: (_, state) {
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
                  itemCount: state.lstHistorial.length,
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     const Text(
                          //       'ID Pedido:',
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     Text('${state.lstHistorial[index].id}'),
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Fecha de salida:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.lstHistorial[index].fechaSalida),
                              // Text(FormatoDate.yMMMEd().format()),
                              Text(
                                DateFormat.yMMMEd().format(DateTime.parse(
                                    state.lstHistorial[index].fechaSalida)),
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
                              // Text(state.lstHistorial[index].fechaEntrega),
                              Text(DateFormat.yMMMEd().format(DateTime.parse(
                                  state.lstHistorial[index].fechaEntrega)))
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
                              Text(state.lstHistorial[index].status),
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
                              Text(state.lstHistorial[index].material),
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
                              Text('${state.lstHistorial[index].cantidad}'),
                            ],
                          ),
                          // Text(
                          //   'Id del pedido ${state.lstHistorial[index].id.toString()}',
                          // ),
                          // Text(
                          //   'Salida: ${state.lstHistorial[index].fechaSalida.toString()}',
                          // ),
                          // Text(
                          //   'Devolución: ${state.lstHistorial[index].fechaEntrega.toString()}',
                          // ),
                          // Text(
                          //   'Estado: ${state.lstHistorial[index].status.toString()}',
                          // ),
                          // Text(
                          //   'Material prestado: ${state.lstHistorial[index].material.toString()}',
                          // ),
                          // Text(
                          //   'Cantidad: ${state.lstHistorial[index].cantidad.toString()}',
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
