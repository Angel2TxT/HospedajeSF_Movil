part of 'registrar_bloc.dart';

class RegistrarState extends Equatable {
  final String errorName;
  final String errorEmail;
  final String errorTelefono;
  final String errorCargo;
  final String errorPassword;
  final String errorRepeatPassword;

  final String name;
  final String email;
  final String telefono;
  final String cargo;
  final String password;
  final String repeatPassword;

  final String message;

  const RegistrarState({
    required this.errorName,
    required this.errorEmail,
    required this.errorTelefono,
    required this.errorCargo,
    required this.errorPassword,
    required this.errorRepeatPassword,
    required this.name,
    required this.email,
    required this.telefono,
    required this.cargo,
    required this.password,
    required this.repeatPassword,
    required this.message,
  });

  RegistrarState copyWith({
    String? errorName,
    String? errorEmail,
    String? errorTelefono,
    String? errorCargo,
    String? errorPassword,
    String? errorRepeatPassword,
    String? name,
    String? email,
    String? telefono,
    String? cargo,
    String? password,
    String? repeatPassword,
    String? message,
  }) =>
      RegistrarState(
        errorName: errorName ?? this.errorName,
        errorEmail: errorEmail ?? this.errorEmail,
        errorTelefono: errorTelefono ?? this.errorTelefono,
        errorCargo: errorCargo ?? this.errorCargo,
        errorPassword: errorPassword ?? this.errorPassword,
        errorRepeatPassword: errorRepeatPassword ?? this.errorRepeatPassword,
        name: name ?? this.name,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        cargo: cargo ?? this.cargo,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        message: message ?? this.message,
      );
  @override
  List<Object> get props => [
        errorName,
        errorEmail,
        errorTelefono,
        errorCargo,
        errorPassword,
        errorRepeatPassword,
        name,
        email,
        telefono,
        cargo,
        password,
        repeatPassword,
        message,
      ];
}
