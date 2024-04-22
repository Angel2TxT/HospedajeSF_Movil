import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';

class MiDrawerAdmin extends StatelessWidget {
  const MiDrawerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Container(
          //   width: 50,
          //   height: 50,
          //   margin: const EdgeInsets.all(50),
          //   child: Image.asset("assets/img/icono.png"),
          // ),
          const SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/icono.png"),
                ),
                color: Color.fromRGBO(208, 236, 231, 1),
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // ListTile(
          //   leading: const Icon(Icons.book),
          //   title: const Text('Libros'),
          //   onTap: () => Navigator.pushNamed(context, 'blocNavigate'),
          // ),
          ListTile(
            leading: const Icon(Icons.room_service),
            title: const Text('Habitaciones'),
            onTap: () => Navigator.pushNamed(context, 'floors'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Clientes'),
            onTap: () => Navigator.pushNamed(context, 'clients_admin'),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Reservaciones'),
            onTap: () => Navigator.pushNamed(context, 'reservations_admin'),
          ),
          // ListTile(
          //   leading: const Icon(Icons.add),
          //   title: const Text('Registrar materiales'),
          //   onTap: () => Navigator.pushNamed(context, 'registrar_materiales'),
          // ),
          // ListTile(
          //   leading: const Icon(Icons.info_outline),
          //   title: const Text('Acerca de'),
          //   onTap: () => Navigator.pushNamed(context, 'home_admin'),
          // ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Salir'),
            onTap: () {
              AuthenticationBloc authenticationBloc =
                  BlocProvider.of<AuthenticationBloc>(
                context,
                listen: false,
              );
              authenticationBloc.add(AuthenticationSignOut());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'blocNavigate', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
