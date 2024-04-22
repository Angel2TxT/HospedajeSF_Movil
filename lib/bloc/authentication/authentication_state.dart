part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUser extends AuthenticationState {
  final String email;
  final String name;
  const AuthenticationUser({required this.name, required this.email});
  @override
  List<Object> get props => [name];
}

class AuthenticationAdmin extends AuthenticationState {
  final String email;
  final String name;
  const AuthenticationAdmin({required this.email, required this.name});
  @override
  List<Object> get props => [name];
}

class AuthenticationFailure extends AuthenticationState {
  const AuthenticationFailure();
}

class AuthenticationInitiale extends AuthenticationState {
  const AuthenticationInitiale();
}
