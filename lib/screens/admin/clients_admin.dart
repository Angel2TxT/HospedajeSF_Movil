import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/bedroom/bedrooms_bloc.dart';
import '../../bloc/clients/clients_bloc.dart';
import '../../widgets/drawerAdmin.dart';
// import '../bloc/bedroom/bedrooms_bloc.dart';
// import '../bloc/floors/floors_bloc.dart';
// import '../controllers/bedrooms_controller.dart';
// import '../widgets/drawerAdmin.dart';

class ClientsAdmin extends StatelessWidget {
  const ClientsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    // BedroomsController controller = BedroomsController(context: context);

    ClientsBloc clientsBloc = BlocProvider.of<ClientsBloc>(
      context,
      listen: false,
    );
    clientsBloc.add(const ClientsGetAllEvent());
    // BedroomsBloc bedroomsBloc = BlocProvider.of<BedroomsBloc>(
    //   context,
    //   listen: false,
    // );
    // bedroomsBloc.add(const BedroomsGetForIdEvent(id: id))


    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
        backgroundColor: const Color(0xff306998),
      ),
      drawer: const MiDrawerAdmin(),
      body: BlocBuilder<ClientsBloc, ClientsState>(
        builder: (_, state) {
          return Container(
          // body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                state.clientsList.isEmpty
                    ? const Text("No hay registro de clientes.")
                    : const SizedBox(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.clientsList.length,
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
                                'Nombre:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.clientsList[index].name),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Apellido paterno:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.clientsList[index].lastName1),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Apellido materno:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.clientsList[index].lastName2),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Teléfono:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.clientsList[index].phone}'),
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
                              Text(state.clientsList[index].state),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Municipio:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(state.clientsList[index].city),
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
