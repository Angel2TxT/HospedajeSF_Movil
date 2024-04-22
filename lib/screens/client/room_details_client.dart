import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bedroom/bedroom_bloc.dart';
import '../../bloc/bedrooms/bedrooms_bloc.dart';
// import 'package:flutter_application_5/widgets/drawerAdmin.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/authentication/authentication_bloc.dart';
// import '../widgets/drawerAdmin.dart';

class RoomDetailsClient extends StatelessWidget {
  const RoomDetailsClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitación'),
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
      // drawer: const MiDrawerAdmin(),
      body: BlocBuilder<BedroomBloc, BedroomState>(
        builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Habitación número: ${state.bedroom.num}",
                  // state.bedroomsList[],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  child: Center(child: Image.network(state.bedroom.url)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Estado: ${state.bedroom.state}",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Más acerca de la habitación:",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ocupantes:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${state.bedroom.occupants}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Máximo de ocupantes:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${state.bedroom.maxOccupants}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Piso:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${state.bedroom.floor}'),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),

              ],
            ),
            // child: Image.asset(
            //   "assets/img/logo.jpg",
            //   height: 120,
            // ),
          ),
          // child: Column(
          //   children: [
          //     TextFieldCustom(
          //       icon: Icons.note,
          //       fn: (value) {
          //         controller.addContenido(value ?? '');
          //         return null;
          //       },
          //     ),
          //     ElevatedButton(
          //       onPressed: state.contenido.trim().isNotEmpty
          //           ? () => controller.addNote()
          //           : null,
          //       child: const Text('Agregar nota'),
          //     ),
          //     Expanded(
          //       // child: SingleChildScrollView(
          //       //   child: Column(children: [
          //       //     const SizedBox(height: 10),
          //       //     ...state.lstNotas.map((nota) => ItemNota(
          //       //         nota: Nota(
          //       //           email: state.email,
          //       //           id: nota.id,
          //       //           text: nota.text,
          //       //         ),
          //       //         fn: (int id) {},
          //       //       ),
          //       //     ),
          //       //   ],
          //       //   ),
          //       // ),
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: state.lstNotas.length,
          //         itemBuilder: (context, index) => ItemNota(
          //           posicion: index,
          //           nota: state.lstNotas[index],
          //           fn: (index) {
          //             controller.deleteNota(state.lstNotas[index]);
          //           },
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        );
        },
      ),
    );
  }
}
