import 'package:flutter/material.dart';
// import 'package:flutter_application_6/screens/home_user.dart';
// import 'package:flutter_application_6/screens/login.dart';
// import 'package:flutter_application_5/repositories/historial_repository.dart';
// import 'package:flutter_application_5/services/notifications_service.dart';

import 'package:intl/date_symbol_data_local.dart';
// import 'package:flutter_application_4/screens/home_user.dart';
// import 'package:flutter_application_4/screens/login.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/bedroom/bedroom_bloc.dart';
import 'bloc/bedrooms/bedrooms_bloc.dart';
import 'bloc/clients/clients_bloc.dart';
import 'bloc/comments/comments_bloc.dart';
import 'bloc/floors/floors_bloc.dart';
import 'bloc/form_login/form_login_bloc.dart';
import 'bloc/historial/historial_bloc.dart';
import 'bloc/lista_materiales/lista_materiales_bloc.dart';
import 'bloc/material/material_bloc.dart';
import 'bloc/notification/notification_bloc.dart';
import 'bloc/prestamos/prestamos_bloc.dart';
import 'bloc/registrar/registrar_bloc.dart';
import 'bloc/reservations/reservations_bloc.dart';
import 'navigation/bloc_navigate.dart';
import 'repositories/admin_repository.dart';
import 'repositories/authentication_repository.dart';
// import 'screens/home_admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/client_repository.dart';
import 'repositories/historial_repository.dart';
import 'repositories/notification_repository.dart';
import 'screens/admin/clients_admin.dart';
import 'screens/admin/comments_admin.dart';
import 'screens/admin/reservations_admin.dart';
import 'screens/bedrooms.dart';
import 'screens/bedrooms_admin.dart';
import 'screens/client/room_details_client.dart';
import 'screens/floors_admin.dart';
import 'screens/historial.dart';
import 'screens/historialAdmin.dart';
import 'screens/home.dart';
import 'screens/home_admin.dart';
import 'screens/home_user.dart';
import 'screens/login.dart';
import 'screens/material.dart';
import 'screens/nuevos_prestamos.dart';

import 'package:intl/intl.dart';

import 'screens/registrar.dart';
import 'screens/registrar_materiales.dart';
import 'screens/seller/bedrooms_seller.dart';
import 'screens/seller/floors_seller.dart';
import 'screens/seller/reservations_seller.dart';
import 'services/notifications_service.dart';


// import 'package:bloc/bloc.dart';
void main() async {
  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null);
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => FormLoginBloc(),
      ),
      BlocProvider(
        create: (context) =>
            AuthenticationBloc(context, AuthenticationRepository()),
      ),
      BlocProvider(
        create: (_) =>
            HistorialBloc(HistorialRepository(), HistorialRepositoryAdmin()),
      ),
      BlocProvider(
        create: (_) => PrestamosBloc(HistorialRepositoryAdmin()),
      ),
      BlocProvider(create: (_) => NotificationBloc(NotificationRepository())),
      BlocProvider(create: (_) => RegistrarBloc()),
      BlocProvider(create: (_) => MaterialBloc()),
      BlocProvider(
        create: (_) => ListaMaterialesBloc(HistorialRepositoryAdmin()),
      ),
      BlocProvider(create: (_) => FloorsBloc(AdminRepository())),
      BlocProvider(create: (_) => BedroomsBloc(ClientRepository(), AdminRepository())),
      BlocProvider(create: (_) => CommentsBloc(AdminRepository())),
      BlocProvider(create: (_) => ClientsBloc(AdminRepository())),
      BlocProvider(create: (_) => BedroomBloc(ClientRepository(), AdminRepository())),
      BlocProvider(create: (_) => ReservationsBloc(ClientRepository(), AdminRepository())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor mainAppColor = const MaterialColor(0xff00a88c, <int, Color>{
      50: Color(0xff00a88c),
      100: Color(0xff00a88c),
      200: Color(0xff00a88c),
      300: Color(0xff00a88c),
      400: Color(0xff00a88c),
      500: Color(0xff00a88c),
      600: Color(0xff00a88c),
      700: Color(0xff00a88c),
      800: Color(0xff00a88c),
      900: Color(0xff00a88c),
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Simple',
      theme: ThemeData(
        primarySwatch: mainAppColor,
      ),
      // home: const BlocNavigate(),
      // initialRoute: 'blocNavigate',
      home: const Bedrooms(),
      initialRoute: 'bedrooms',
      routes: {
        'blocNavigate': (_) => const BlocNavigate(),
        'historial': (_) => const Historial(),
        'historialAdmin': (_) => const HistorialAdmin(),
        'nuevos': (_) => const NuevosPedidos(),
        'registrar': (_) => const Registrar(),
        'login': (_) => const LoginPage(),
        'materiales': (_) => const Materiales(),
        'registrar_materiales': (_) => const RegistrarMaterial(),
        'home_admin': (_) => const HomeAdmin(),
        'home_user': (_) => const HomeUser(),
        'bedrooms': (_) => const Bedrooms(),
        'floors': (_) => const FloorsAdmin(),
        'bedrooms_admin': (_) => const BedroomsAdmin(),
        'comments_admin': (_) => const CommentsClient(),
        'clients_admin': (_) => const ClientsAdmin(),
        'bedrooms_seller': (_) => const BedroomsSeller(),
        'room_details_client': (_) => const RoomDetailsClient(),
        'floors_seller': (_) => const FloorsSeller(),
        'reservations_admin': (_) => const ReservationsAdmin(),
        'reservations_seller': (_) => const ReservationsSeller(),
        'home': (_) => const Home(),
        // 'Login': (_) => const LoginPage(),
        // 'HomeUser': (_) => const HomeUser(),
        // 'HomeAdmin': (_) => const HomeAdmin(),
      },
    );
  }
}
