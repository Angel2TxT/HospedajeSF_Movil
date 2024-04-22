part of 'registrar_bloc.dart';

abstract class RegistrarEvent extends Equatable {
  const RegistrarEvent();

  @override
  List<Object> get props => [];
}

//name
class ErrorRegistrarNameCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameCorrectEvent(this.error);
}

class ErrorRegistrarNameShortEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameShortEvent(this.error);
}

class ErrorRegistrarNameLengthEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameLengthEvent(this.error);
}

class ErrorRegistrarNameEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameEmptyEvent(this.error);
}

class ValidoRegistrarNameEvent extends RegistrarEvent {
  const ValidoRegistrarNameEvent();
}

//email
class ErrorRegistrarEmailCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarEmailCorrectEvent(this.error);
}

class ErrorRegistrarEmailLengthEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarEmailLengthEvent(this.error);
}

class ErrorRegistrarEmailEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarEmailEmptyEvent(this.error);
}

class ValidoRegistrarEmailEvent extends RegistrarEvent {
  const ValidoRegistrarEmailEvent();
}

//telefono
class ErrorRegistrarTelefonoCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarTelefonoCorrectEvent(this.error);
}

class ErrorRegistrarTelefonoShortEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarTelefonoShortEvent(this.error);
}

class ErrorRegistrarTelefonoLengthEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarTelefonoLengthEvent(this.error);
}

class ErrorRegistrarTelefonoEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarTelefonoEmptyEvent(this.error);
}

class ValidoRegistrarTelefonoEvent extends RegistrarEvent {
  const ValidoRegistrarTelefonoEvent();
}

//cargo
class ErrorRegistrarCargoCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarCargoCorrectEvent(this.error);
}

class ErrorRegistrarCargoShortEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarCargoShortEvent(this.error);
}

class ErrorRegistrarCargoLengthEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarCargoLengthEvent(this.error);
}

class ErrorRegistrarCargoEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarCargoEmptyEvent(this.error);
}

class ValidoRegistrarCargoEvent extends RegistrarEvent {
  const ValidoRegistrarCargoEvent();
}

//password
class ErrorRegistrarPasswordCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarPasswordCorrectEvent(this.error);
}

class ErrorRegistrarPasswordShortEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarPasswordShortEvent(this.error);
}

class ErrorRegistrarPasswordLengthEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarPasswordLengthEvent(this.error);
}

class ErrorRegistrarPasswordEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarPasswordEmptyEvent(this.error);
}

class ValidoRegistrarPasswordEvent extends RegistrarEvent {
  const ValidoRegistrarPasswordEvent();
}

//repeatPassword
class ErrorRegistrarRepeatPasswordCorrectEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarRepeatPasswordCorrectEvent(this.error);
}

// class ErrorRegistrarRepeatPasswordShortEvent extends RegistrarEvent {
//   final String error;
//   const ErrorRegistrarRepeatPasswordShortEvent(this.error);
// }

// class ErrorRegistrarRepeatPasswordLengthEvent extends RegistrarEvent {
//   final String error;
//   const ErrorRegistrarRepeatPasswordLengthEvent(this.error);
// }

// class ErrorRegistrarRepeatPasswordEmptyEvent extends RegistrarEvent {
//   final String error;
//   const ErrorRegistrarRepeatPasswordEmptyEvent(this.error);
// }

class ValidoRegistrarRepeatPasswordEvent extends RegistrarEvent {
  const ValidoRegistrarRepeatPasswordEvent();
}

//valores
class RegistrarNameEvent extends RegistrarEvent {
  final String value;
  const RegistrarNameEvent(this.value);
}

class RegistrarEmailEvent extends RegistrarEvent {
  final String value;
  const RegistrarEmailEvent(this.value);
}

class RegistrarTelefonoEvent extends RegistrarEvent {
  final String value;
  const RegistrarTelefonoEvent(this.value);
}

class RegistrarCargoEvent extends RegistrarEvent {
  final String value;
  const RegistrarCargoEvent(this.value);
}

class RegistrarPasswordEvent extends RegistrarEvent {
  final String value;
  const RegistrarPasswordEvent(this.value);
}

class RegistrarRepeatPasswordEvent extends RegistrarEvent {
  final String value;
  const RegistrarRepeatPasswordEvent(this.value);
}

//message
class RegistrarMessageEvent extends RegistrarEvent {
  final String message;
  const RegistrarMessageEvent(this.message);
}
