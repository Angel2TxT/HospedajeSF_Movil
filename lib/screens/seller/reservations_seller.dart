import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// import '../bloc/bedroom/bedrooms_bloc.dart';
import '../../bloc/clients/clients_bloc.dart';
import '../../bloc/reservations/reservations_bloc.dart';
import '../../widgets/drawer.dart';
import '../../widgets/drawerAdmin.dart';
// import '../bloc/bedroom/bedrooms_bloc.dart';
// import '../bloc/floors/floors_bloc.dart';
// import '../controllers/bedrooms_controller.dart';
// import '../widgets/drawerAdmin.dart';

class ReservationsSeller extends StatelessWidget {
  const ReservationsSeller({super.key});

  @override
  Widget build(BuildContext context) {
    ReservationsBloc reservationsBloc = BlocProvider.of<ReservationsBloc>(
      context,
      listen: false,
    );
    reservationsBloc.add(const ReservationsGetAllEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservaciones"),
        backgroundColor: const Color(0xff306998),
      ),
      drawer: const MiDrawer(),
      body: BlocBuilder<ReservationsBloc, ReservationsState>(
        builder: (_, state) {
          return Container(
          // body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                state.reservationsList.isEmpty
                    ? const Text("No hay registro de reservaciones.")
                    : const SizedBox(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.reservationsList.length,
                    // itemCount: 1,
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
                                'Fecha de entrada:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                                Text(DateFormat.yMMMEd().format(DateTime.parse(
                                    state.reservationsList[index].date1),),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Fecha salida:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.reservationsList[index].date2),
                              Text(DateFormat.yMMMEd().format(DateTime.parse(
                                    state.reservationsList[index].date2),),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Número de personas:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.reservationsList[index].peoples}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Número de personas extras:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.reservationsList[index].extraPeoples}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Descripción:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.reservationsList[index].state),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Nombre del cliente:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.reservationsList[index].client),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Vendedor:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.reservationsList[index].employee),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Precio especial:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.reservationsList[index].specialPrice),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Comentario:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(state.reservationsList[index].specialPrice),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // const Text(
                              //   'Precio especial:',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Text(state.reservationsList[index].commentary),
                            ],
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      // );
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Acción a realizar cuando se presiona el botón
      //     Navigator.pushNamed(context, 'blocNavigate');
      //   },
      //   label: const Text('Acceder'),
      //   icon: const Icon(Icons.login),
      //   backgroundColor: const Color(0xff306998),
      ),
    );
  }
}
