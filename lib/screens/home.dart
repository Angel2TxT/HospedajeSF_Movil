import 'package:flutter/material.dart';

import '../widgets/drawerAdmin.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactanos'),

      ),
      // drawer: const MiDrawerAdmin(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Hotel San Felipe de Jesús",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                child: Center(child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1200px-WhatsApp.svg.png"),),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "9611724435",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                child: Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXoMFtNYy-gfuvVnQkKSiDAmfYt0ynmaGz55WPNbUPZw&s"),),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hospedaje San Felipe de Jésus",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text("Hospedaje San Felipe de Jesús"),
              // const Text("https://www.facebook.com/hospedajesanfelipedejesus?mibextid=kFxxJD"),

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
    // });
  }
}
