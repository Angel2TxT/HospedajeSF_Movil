import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/bedroom/bedrooms_bloc.dart';
import '../../bloc/floors/floors_bloc.dart';
import '../../controllers/bedrooms_controller.dart';
import '../../widgets/drawer.dart';
// import '../bloc/bedroom/bedrooms_bloc.dart';
// import '../bloc/floors/floors_bloc.dart';
// import '../controllers/bedrooms_controller.dart';
// import '../widgets/drawerAdmin.dart';

class FloorsSeller extends StatelessWidget {
  const FloorsSeller({super.key});

  @override
  Widget build(BuildContext context) {
    BedroomsController controller = BedroomsController(context: context);

    FloorsBloc floorsBloc = BlocProvider.of<FloorsBloc>(
      context,
      listen: false,
    );
    floorsBloc.add(const FloorsGetAllEvent());
    // BedroomsBloc bedroomsBloc = BlocProvider.of<BedroomsBloc>(
    //   context,
    //   listen: false,
    // );
    // bedroomsBloc.add(const BedroomsGetForIdEvent(id: id))


    return Scaffold(
      appBar: AppBar(
        title: const Text("Pisos"),
        backgroundColor: const Color(0xff306998),
      ),
      drawer: const MiDrawer(),
      body: BlocBuilder<FloorsBloc, FloorsState>(
        builder: (_, state) {
          return Container(
          // body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                state.floorsList.isEmpty
                    ? const Text("No hay registro de pisos...")
                    : const SizedBox(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.floorsList.length,
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
                            Text(
                              "Piso: ${state.floorsList[index].id}",
                              // "Piso: 1",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff306998),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 7),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Acción a realizar cuando se presiona el botón
                                print('Botón "Ir" presionado');
                                controller.getBedroomsSeller(state.floorsList[index].id);
                                // controller.getBedrooms(state.floorsList);
                              },
                              icon: Icon(Icons.directions),
                              label: Text('Ir'),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     controller.getBedrooms(1);
                            //   }, 
                            //   child: Text("Ir"),
                            //   )
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
