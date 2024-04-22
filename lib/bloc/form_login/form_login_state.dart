part of 'form_login_bloc.dart';

class FormLoginState extends Equatable {
  final String errorEmail;
  final String msgResponse;
  final String msgPassword;
  final String email;
  final String password;

  const FormLoginState({
    required this.errorEmail,
    required this.msgResponse,
    required this.msgPassword,
    required this.password,
    required this.email,
  });

  FormLoginState copyWith({
    String? errorEmail,
    String? msgResponse,
    String? msgPassword,
    String? email,
    String? password,
  }) =>
      FormLoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        errorEmail: errorEmail ?? this.errorEmail,
        msgResponse: msgResponse ?? this.msgResponse,
        msgPassword: msgPassword ?? this.msgPassword,
      );

  @override
  List<Object> get props =>
      [email, password, errorEmail, msgResponse, msgPassword];
}
