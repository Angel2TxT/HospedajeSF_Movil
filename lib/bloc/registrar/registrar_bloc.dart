import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  RegistrarBloc()
      : super(const RegistrarState(
          errorName: '',
          errorEmail: '',
          errorTelefono: '',
          errorCargo: '',
          errorPassword: '',
          errorRepeatPassword: '',
          name: '',
          email: '',
          telefono: '',
          cargo: '',
          password: '',
          repeatPassword: '',
          message: '',
        )) {
    //name
    on<ErrorRegistrarNameCorrectEvent>((event, emit) => emit(
          state.copyWith(errorName: event.error),
        ));
    on<ErrorRegistrarNameShortEvent>((event, emit) => emit(
          state.copyWith(errorName: event.error),
        ));
    on<ErrorRegistrarNameLengthEvent>((event, emit) => emit(
          state.copyWith(errorName: event.error),
        ));
    on<ErrorRegistrarNameEmptyEvent>((event, emit) => emit(
          state.copyWith(errorName: event.error),
        ));
    on<ValidoRegistrarNameEvent>((event, emit) => emit(
          state.copyWith(errorName: ''),
        ));

    //email
    on<ErrorRegistrarEmailCorrectEvent>((event, emit) => emit(
          state.copyWith(errorEmail: event.error),
        ));
    on<ErrorRegistrarEmailLengthEvent>((event, emit) => emit(
          state.copyWith(errorEmail: event.error),
        ));
    on<ErrorRegistrarEmailEmptyEvent>((event, emit) => emit(
          state.copyWith(errorEmail: event.error),
        ));
    on<ValidoRegistrarEmailEvent>((event, emit) => emit(
          state.copyWith(errorEmail: ''),
        ));

    //telefono
    on<ErrorRegistrarTelefonoCorrectEvent>((event, emit) => emit(
          state.copyWith(errorTelefono: event.error),
        ));
    on<ErrorRegistrarTelefonoShortEvent>((event, emit) => emit(
          state.copyWith(errorTelefono: event.error),
        ));
    on<ErrorRegistrarTelefonoLengthEvent>((event, emit) => emit(
          state.copyWith(errorTelefono: event.error),
        ));
    on<ErrorRegistrarTelefonoEmptyEvent>((event, emit) => emit(
          state.copyWith(errorTelefono: event.error),
        ));
    on<ValidoRegistrarTelefonoEvent>((event, emit) => emit(
          state.copyWith(errorTelefono: ''),
        ));

    //cargo
    on<ErrorRegistrarCargoCorrectEvent>((event, emit) => emit(
          state.copyWith(errorCargo: event.error),
        ));
    on<ErrorRegistrarCargoShortEvent>((event, emit) => emit(
          state.copyWith(errorCargo: event.error),
        ));
    on<ErrorRegistrarCargoLengthEvent>((event, emit) => emit(
          state.copyWith(errorCargo: event.error),
        ));
    on<ErrorRegistrarCargoEmptyEvent>((event, emit) => emit(
          state.copyWith(errorCargo: event.error),
        ));
    on<ValidoRegistrarCargoEvent>((event, emit) => emit(
          state.copyWith(errorCargo: ''),
        ));

    //password
    on<ErrorRegistrarPasswordCorrectEvent>((event, emit) => emit(
          state.copyWith(errorPassword: event.error),
        ));
    on<ErrorRegistrarPasswordShortEvent>((event, emit) => emit(
          state.copyWith(errorPassword: event.error),
        ));
    on<ErrorRegistrarPasswordLengthEvent>((event, emit) => emit(
          state.copyWith(errorPassword: event.error),
        ));
    on<ErrorRegistrarPasswordEmptyEvent>((event, emit) => emit(
          state.copyWith(errorPassword: event.error),
        ));
    on<ValidoRegistrarPasswordEvent>((event, emit) => emit(
          state.copyWith(errorPassword: ''),
        ));

    //repeatPassword
    on<ErrorRegistrarRepeatPasswordCorrectEvent>((event, emit) => emit(
          state.copyWith(errorRepeatPassword: event.error),
        ));
    // on<ErrorRegistrarRepeatPasswordShortEvent>((event, emit) => emit(
    //       state.copyWith(errorName: event.error),
    //     ));
    // on<ErrorRegistrarRepeatPasswordLengthEvent>((event, emit) => emit(
    //       state.copyWith(errorName: event.error),
    //     ));
    // on<ErrorRegistrarRepeatPasswordEmptyEvent>((event, emit) => emit(
    //       state.copyWith(errorName: event.error),
    //     ));
    on<ValidoRegistrarRepeatPasswordEvent>((event, emit) => emit(
          state.copyWith(errorRepeatPassword: ''),
        ));

    //values
    on<RegistrarNameEvent>((event, emit) => emit(
          state.copyWith(name: event.value),
        ));
    on<RegistrarEmailEvent>((event, emit) => emit(
          state.copyWith(email: event.value),
        ));
    on<RegistrarTelefonoEvent>((event, emit) => emit(
          state.copyWith(telefono: event.value),
        ));
    on<RegistrarCargoEvent>((event, emit) => emit(
          state.copyWith(cargo: event.value),
        ));
    on<RegistrarPasswordEvent>((event, emit) => emit(
          state.copyWith(password: event.value),
        ));
    on<RegistrarRepeatPasswordEvent>((event, emit) => emit(
          state.copyWith(repeatPassword: event.value),
        ));

    //message
    on<RegistrarMessageEvent>((event, emit) => emit(
          state.copyWith(message: event.message),
        ));
  }
}
