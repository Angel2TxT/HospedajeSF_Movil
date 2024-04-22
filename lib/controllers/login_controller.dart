import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/form_login/form_login_bloc.dart';
import '../utils/validador.dart';

class LoginController {
  final BuildContext context;
  late final FormLoginBloc formLoginBloc;
  late final AuthenticationBloc authenticationBloc;
  LoginController({required this.context}) {
    formLoginBloc = BlocProvider.of<FormLoginBloc>(
      context,
      listen: false,
    );
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: false,
    );
  }

  void signIn() {
    authenticationBloc.add(AuthenticationStarted(
        email: formLoginBloc.state.email, pass: formLoginBloc.state.password));
  }

  void changeEmail(String value) {
    // String mensaje = 'Correo no válido';
    String mensaje = '';
    if (Validate(value).isEmail()) {
      mensaje = '';
    }
    formLoginBloc.add(FormLoginChangeEmailEvent(email: value, msg: mensaje));
  }

  void changePassword(String value) {
    String mensaje = '';
    if (value.isEmpty) {
      mensaje = 'El password no puede estar vacío';
    }
    formLoginBloc
        .add(FormLoginChangePasswordEvent(password: value, msg: mensaje));
  }
}
