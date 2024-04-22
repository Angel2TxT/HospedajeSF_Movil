import 'package:flutter/material.dart';
// import 'package:flutter_application_5/screens/historial.dart';
// import 'package:flutter_application_5/screens/historialAdmin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospedaje_san_felipe_de_jesus/screens/bedrooms.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/notification/notification_bloc.dart';
// import '../screens/historial.dart';
// import '../screens/historialAdmin.dart';
// import '../screens/bedrooms.dart';
import '../screens/floors_admin.dart';
import '../screens/home_admin.dart';
import '../screens/home_user.dart';
import '../screens/login.dart';
import '../screens/seller/floors_seller.dart';

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
      if (state is AuthenticationUser) {
        NotificationBloc notificationBloc = BlocProvider.of<NotificationBloc>(
          context,
          listen: false,
        );
        notificationBloc.add(NotificationsGetEvent());

        // return const HomeUser();
        return const FloorsSeller();

        // return const Historial();
      } else if (state is AuthenticationAdmin) {
        NotificationBloc notificationBloc = BlocProvider.of<NotificationBloc>(
          context,
          listen: false,
        );
        notificationBloc.add(const NotificationsGetEvent());

        // return const HistorialAdmin();
        // return const HomeAdmin();
        
        return const FloorsAdmin();
      } else {
        return const LoginPage();
        // return const Beedrooms();
      }
    });
  }
}
