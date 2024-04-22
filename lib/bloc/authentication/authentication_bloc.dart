import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../models/user_credential.dart';
import '../../repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../form_login/form_login_bloc.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final BuildContext _context;

  AuthenticationBloc(this._context, this._authenticationRepository)
      : super(const AuthenticationInitiale()) {
    on<AuthenticationStarted>((event, emit) async {
      // print("--------------------------------auth");
      // print(event.email);
      // print(event.pass);
      UserCredential? userCredential = await _authenticationRepository
          .signIn(User(email: event.email, pass: event.pass));

      if (userCredential != null && userCredential.cargo == 'ADMIN') {
        emit(
            AuthenticationAdmin(email: event.email, name: userCredential.name));
        // if (_context.mounted) {
        _context.read<FormLoginBloc>().add(FormLoginInitializeEvent());
        // }
      } else if (userCredential != null && userCredential.cargo == 'VENDEDOR') {
        emit(AuthenticationUser(email: event.email, name: userCredential.name));
        // if (_context.mounted) {
        _context.read<FormLoginBloc>().add(FormLoginInitializeEvent());
        // }
      } else {
        emit(const AuthenticationFailure());
        // if (_context.mounted) {
        _context
            .read<FormLoginBloc>()
            .add(FormLoginResponseEvent(msg: 'usuario inválido'));
        // }
      }
    });
    on<AuthenticationSignOut>(
        (event, emit) => emit(const AuthenticationInitiale()));
  }
}
