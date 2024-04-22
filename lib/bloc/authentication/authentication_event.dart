part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {
  final String email;
  final String pass;
  AuthenticationStarted({required this.email, required this.pass});
}

class AuthenticationSignOut extends AuthenticationEvent {}
