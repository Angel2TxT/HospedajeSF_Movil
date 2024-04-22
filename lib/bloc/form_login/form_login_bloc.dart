import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_login_state.dart';
part 'form_login_event.dart';

class FormLoginBloc extends Bloc<FormLoginEvent, FormLoginState> {
  FormLoginBloc()
      : super(const FormLoginState(
          email: '',
          password: '',
          errorEmail: '',
          msgResponse: '',
          msgPassword: '',
        )) {
    on<FormLoginChangeEmailEvent>((event, emit) => emit(
          state.copyWith(email: event.email, errorEmail: event.msg),
        ));
    on<FormLoginChangePasswordEvent>((event, emit) => emit(
          state.copyWith(password: event.password, msgPassword: event.msg),
        ));
    on<FormLoginResponseEvent>((event, emit) => emit(
          state.copyWith(msgResponse: event.msg),
        ));
    on<FormLoginInitializeEvent>((event, emit) => emit(
          state.copyWith(
              email: '',
              password: '',
              msgPassword: '',
              msgResponse: '',
              errorEmail: ''),
        ));
  }
}
