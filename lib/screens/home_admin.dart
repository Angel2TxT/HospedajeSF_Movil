import 'package:flutter/material.dart';
// import 'package:flutter_application_5/widgets/drawerAdmin.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/authentication/authentication_bloc.dart';
import '../widgets/drawerAdmin.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Acerca de...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Versión 1.0.0",
                style: TextStyle(fontSize: 15),
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
      ),
    );
  }
}
