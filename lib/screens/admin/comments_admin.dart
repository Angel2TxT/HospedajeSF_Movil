import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/bedroom/bedrooms_bloc.dart';
import '../../bloc/comments/comments_bloc.dart';
import '../../widgets/drawerAdmin.dart';
// import '../bloc/bedroom/bedrooms_bloc.dart';
// import '../bloc/floors/floors_bloc.dart';
// import '../controllers/bedrooms_controller.dart';
// import '../widgets/drawerAdmin.dart';

class CommentsClient extends StatelessWidget {
  const CommentsClient({super.key});

  @override
  Widget build(BuildContext context) {
    // BedroomsController controller = BedroomsController(context: context);

    CommentsBloc commentsBloc = BlocProvider.of<CommentsBloc>(
      context,
      listen: false,
    );
    commentsBloc.add(const CommentsGetAllEvent());
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
      drawer: MiDrawerAdmin(),
      body: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (_, state) {
          return Container(
          // body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                state.commentsList.isEmpty
                    ? const Text("No hay registro de commentarios.")
                    : const SizedBox(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.commentsList.length,
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
                              // const Text(
                              //   ':',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // Text(state.lstHistorial[index].fechaSalida),
                              // Text(FormatoDate.yMMMEd().format()),
                              Text(
                                state.commentsList[index].comment,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                              Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'cliente:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.commentsList[index].client}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Empleado:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${state.commentsList[index].employee}'),
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
