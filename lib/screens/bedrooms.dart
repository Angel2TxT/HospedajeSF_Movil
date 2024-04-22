import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bedrooms/bedrooms_bloc.dart';
import '../controllers/bedrooms_controller.dart';
import '../widgets/drawerAdmin.dart';

class Bedrooms extends StatelessWidget {
  const Bedrooms({super.key});

  @override
  Widget build(BuildContext context) {
    BedroomsController controller = BedroomsController(context: context);

    BedroomsBloc bedroomsBloc = BlocProvider.of<BedroomsBloc>(
      context,
      listen: false,
    );
    bedroomsBloc.add(const BedroomsGetAllEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habitaciones"),
        actions: [
          IconButton(
            icon: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1200px-WhatsApp.svg.png',
            ),
            onPressed: () {
                      Navigator.pushNamed(context, 'home');

            },
          ),
          // IconButton(
          //   icon: Image.network(
          //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXoMFtNYy-gfuvVnQkKSiDAmfYt0ynmaGz55WPNbUPZw&s',
          //   ),
          //   onPressed: () {
          //             Navigator.pushNamed(context, 'home');

          //   },
          // ),
        ],
      ),
      // drawer: const MiDrawerAdmin(),
      body: BlocBuilder<BedroomsBloc, BedroomsState>(
        builder: (_, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                state.bedroomsList.isEmpty
                    ? const Text("No hay registro de habitaciones.")
                    : const SizedBox(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.bedroomsList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.getBedroom(state.bedroomsList[index].id);
                        // Navigator.pushNamed(context, 'room_details_client');
                        // print(state.bedroomsList[index].id);
                        
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(10),
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                  "Número de habitación: ${state.bedroomsList[index].num}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff306998),
                                    fontWeight: FontWeight.w700,
                                  )),
                              const SizedBox(height: 7),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    state.bedroomsList[index].url,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Ocupantes:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${state.bedroomsList[index].occupants}',
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
                                  Text(state.bedroomsList[index].state),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Acción a realizar cuando se presiona el botón
          Navigator.pushNamed(context, 'blocNavigate');
        },
        label: const Text('Acceder'),
        icon: const Icon(Icons.login),
        backgroundColor: const Color(0xff306998),
      ),
  //     floatingActionButton: Row(
  // mainAxisAlignment: MainAxisAlignment.end,
  // children: [
  //       FloatingActionButton(
  //     onPressed: () {
  //       // Acción a realizar cuando se presiona el nuevo botón
  //       // Agrega aquí la acción que deseas realizar
  //       Navigator.pushNamed(context, 'home');

  //     },
  //     child: Icon(Icons.message), // Cambia el icono según tus necesidades
  //     backgroundColor: Colors.blue, // Cambia el color según tus necesidades
  //   ),

  //   const SizedBox(width: 10),

  //   FloatingActionButton.extended(
  //     onPressed: () {
  //       // Acción a realizar cuando se presiona el botón "Acceder"
  //       Navigator.pushNamed(context, 'blocNavigate');
  //     },
  //     label: const Text('Acceder'),
  //     icon: const Icon(Icons.login),
  //     backgroundColor: const Color(0xff306998),
  //   ),

  // ],
// ),

      
    );
  }
}
