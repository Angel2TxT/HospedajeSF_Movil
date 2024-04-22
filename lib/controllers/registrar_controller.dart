import 'package:flutter/material.dart';
// import 'package:flutter_application_6/controllers/login_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/form_login/form_login_bloc.dart';
import '../bloc/registrar/registrar_bloc.dart';
import '../models/UserRegister.dart';
// import '../models/user.dart';
// import '../repositories/authentication_repository.dart';
import '../services/mysql/connection.dart';
import '../utils/validador.dart';
// import 'login_controller.dart';

class RegistrarController {
  final BuildContext context;
  late final AuthenticationBloc authenticationBloc;
  late final RegistrarBloc registrarBloc;

  // late final Connection mysqlService;
  // late final AuthenticationRepository authenticationRepository;

  Connection ms = Connection();

  late final FormLoginBloc formLoginBloc;

  // late final FormLoginBloc formLoginBloc;

  // late final LoginController loginController;
  // LoginController loginController = LoginController();

  // LoginController loginController = LoginController(context: context);
  // late final UserBloc userBloc;

  // final Map<String, String> formValues = {
  //   'name': '',
  //   'email': '',
  //   'telefono': '',
  //   'cargo': '',
  //   'password': '',
  //   'repeatPassword': '',
  // };

  RegistrarController({
    required this.context,
  }) {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(
      context,
      listen: false,
    );
    registrarBloc = BlocProvider.of<RegistrarBloc>(
      context,
      listen: false,
    );
    formLoginBloc = BlocProvider.of<FormLoginBloc>(
      context,
      listen: false,
    );
  }

  String? validarName(String? value) {
    if (!Validate(value ?? '').isName()) {
      registrarBloc
          .add(const ErrorRegistrarNameCorrectEvent('No se aceptan números'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarNameEmptyEvent(
          'El nombre no puede quedar vacío'));
    } else if (value.length < 3) {
      registrarBloc.add(
          const ErrorRegistrarNameShortEvent('El nombre es demasiado corto'));
    } else if (value.length > 50) {
      registrarBloc.add(const ErrorRegistrarNameLengthEvent(
          'No deve exceder los 50 caracteres'));
    } else {
      registrarBloc.add(const ValidoRegistrarNameEvent());
    }
    return null;
  }

  String? validarEmail(String? value) {
    if (!Validate(value ?? '').isEmail()) {
      registrarBloc
          .add(const ErrorRegistrarEmailCorrectEvent('Correo no válido'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarEmailEmptyEvent(
          'El correo no puede quedar vacío'));
    } else if (value.length > 50) {
      registrarBloc.add(const ErrorRegistrarEmailLengthEvent(
          'No deve exceder los 50 caracteres'));
    } else {
      registrarBloc.add(const ValidoRegistrarEmailEvent());
    }
    return null;
  }

  String? validarTelefono(String? value) {
    if (!Validate(value ?? '').isNum()) {
      registrarBloc.add(
          const ErrorRegistrarTelefonoCorrectEvent('No se aceptan letras'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarTelefonoEmptyEvent(
          'El telefono no puede quedar vacío'));
    } else if (value.length < 10) {
      registrarBloc.add(const ErrorRegistrarTelefonoShortEvent(
          'Introdusca todos los digitos'));
    } else if (value.length > 10) {
      registrarBloc.add(
          const ErrorRegistrarTelefonoLengthEvent('No exceda los 10 digitos'));
    } else {
      registrarBloc.add(const ValidoRegistrarTelefonoEvent());
    }
    return null;
  }

  String? validarCargo(String? value) {
    if (!Validate(value ?? '').isName()) {
      registrarBloc
          .add(const ErrorRegistrarCargoCorrectEvent('No se aceptan números'));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarCargoEmptyEvent(
          'El cargo no puede quedar vacío'));
    } else if (value.length < 3) {
      registrarBloc.add(
          const ErrorRegistrarCargoShortEvent('El nombre es demasiado corto'));
    } else if (value.length > 50) {
      registrarBloc.add(const ErrorRegistrarCargoLengthEvent(
          'No deve exceder los 50 caracteres'));
    } else {
      registrarBloc.add(const ValidoRegistrarCargoEvent());
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (!Validate(value ?? '').isPassword()) {
      registrarBloc.add(const ErrorRegistrarPasswordCorrectEvent('''
          La contraseña debe al menos un digíto,
          al menos una minúscula,
          al menos una mayúscula y
          al menos un caracter no alfanumérico.      
        '''));
    } else if (value!.isEmpty) {
      registrarBloc.add(const ErrorRegistrarPasswordEmptyEvent(
          'El password no puede quedar vacío'));
    } else if (value.length < 8) {
      registrarBloc.add(const ErrorRegistrarPasswordShortEvent(
          'El nombre es demasiado corto'));
    } else if (value.length > 50) {
      registrarBloc.add(const ErrorRegistrarPasswordLengthEvent(
          'La contraseña es muy larga, no podra recordarla jejeje'));
    } else {
      registrarBloc.add(const ValidoRegistrarPasswordEvent());
    }
    return null;
  }

  String? validarRepeatPassword({password, repeatPassword}) {
    if ((registrarBloc.state.password == repeatPassword) ||
        (registrarBloc.state.repeatPassword == password)) {
      registrarBloc.add(const ValidoRegistrarRepeatPasswordEvent());
    } else {
      registrarBloc.add(const ErrorRegistrarRepeatPasswordCorrectEvent(
          'La contraseña no son iguales'));
    }
    return null;
  }

  bool botonActivo() {
    return registrarBloc.state.errorName == '' &&
        registrarBloc.state.errorEmail == '' &&
        registrarBloc.state.errorTelefono == '' &&
        registrarBloc.state.errorCargo == '' &&
        registrarBloc.state.errorPassword == '' &&
        registrarBloc.state.errorRepeatPassword == '' &&
        registrarBloc.state.name != '' &&
        registrarBloc.state.email != '' &&
        registrarBloc.state.telefono != '' &&
        registrarBloc.state.cargo != '' &&
        registrarBloc.state.password != '';
  }

  void registrarUser() async {
    UserRegister userRegister = UserRegister(
      name: registrarBloc.state.name,
      email: registrarBloc.state.email,
      telefono: registrarBloc.state.telefono,
      cargo: registrarBloc.state.cargo,
      password: registrarBloc.state.password,
    );

    UserRegister? temp = await ms.getUser(userRegister);

    if (temp == null) {
      await ms.registerUser(userRegister);
      // authenticationBloc.add(AuthenticationStarted(
      //     email: registrarBloc.state.email,
      //     pass: registrarBloc.state.password));
      registrarBloc
          .add(const RegistrarMessageEvent('El usuario se creo con éxito'));
      // Navigator.pushNamed(context, 'registrar');
      formLoginBloc.add(FormLoginInitializeEvent());

      //Login
      formLoginBloc
          .add(FormLoginChangeEmailEvent(email: userRegister.email, msg: ''));

      formLoginBloc.add(FormLoginChangePasswordEvent(
          password: userRegister.password, msg: ''));

      authenticationBloc.add(AuthenticationStarted(
          email: userRegister.email, pass: userRegister.password));

      Navigator.pushNamed(context, 'home_user');

      // loginController.changeEmail(userRegister.email);
      // loginController.changePassword(userRegister.password);
      // loginController.signIn();
    } else {
      registrarBloc.add(const RegistrarMessageEvent('El usuario ya existe'));
      // authenticationBloc.add(AuthenticationStarted(
      //     email: registrarBloc.state.email,
      //     pass: registrarBloc.state.password));
      // authenticationBloc.add(AuthenticationStarted(
      //     email: registrarBloc.state.email,
      //     pass: registrarBloc.state.password));
      // print(registrarBloc.state.email);
      // print(registrarBloc.state.password);
    }

    // User user = User(
    //   email: registrarBloc.state.email,
    //   pass: registrarBloc.state.password,
    // );
    // authenticationRepository.signIn(user);
  }

  void name(String? value) {
    registrarBloc.add(RegistrarNameEvent(value ?? ''));
  }

  void email(String? value) {
    registrarBloc.add(RegistrarEmailEvent(value ?? ''));
  }

  void telefono(String? value) {
    registrarBloc.add(RegistrarTelefonoEvent(value ?? ''));
  }

  void cargo(String? value) {
    registrarBloc.add(RegistrarCargoEvent(value ?? ''));
  }

  void password(String? value) {
    registrarBloc.add(RegistrarPasswordEvent(value ?? ''));
  }

  void repeatPassword(String? value) {
    registrarBloc.add(RegistrarRepeatPasswordEvent(value ?? ''));
  }

  void messageInitiale() {
    registrarBloc.add(const RegistrarMessageEvent(''));
  }
}
