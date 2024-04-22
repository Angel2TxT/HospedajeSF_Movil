import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(208, 236, 231, 1),
                image: DecorationImage(
                  image: AssetImage("assets/img/icono.png"),
                ),
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
            leading: const Icon(Icons.list),
            title: const Text('Reservaciones'),
            onTap: () => Navigator.pushNamed(context, 'reservations_seller'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Habitaciones'),
            onTap: () => Navigator.pushNamed(context, 'floors_seller'),
          ),
          // ListTile(
          //   leading: const Icon(Icons.info_outline),
          //   title: const Text('Reservaciones'),
          //   onTap: () => Navigator.pushNamed(context, 'home_user'),
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
