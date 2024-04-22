part of 'form_login_bloc.dart';

abstract class FormLoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FormLoginChangeEmailEvent extends FormLoginEvent {
  final String msg;
  final String email;
  FormLoginChangeEmailEvent({required this.msg, required this.email});
}

class FormLoginChangePasswordEvent extends FormLoginEvent {
  final String msg;
  final String password;
  FormLoginChangePasswordEvent({required this.msg, required this.password});
}

class FormLoginResponseEvent extends FormLoginEvent {
  final String msg;
  FormLoginResponseEvent({required this.msg});
}

class FormLoginInitializeEvent extends FormLoginEvent {
  FormLoginInitializeEvent();
}
