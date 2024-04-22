import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/registrar/registrar_bloc.dart';
import '../controllers/registrar_controller.dart';
import '../widgets/textfield_custom.dart';

class Registrar extends StatelessWidget {
  const Registrar({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrarController controller = RegistrarController(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/img/icono.png"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Salir',
            onPressed: () {
              Navigator.pushNamed(context, 'login');
              controller.messageInitiale();
            },
          ),
        ],
      ),
      body: BlocBuilder<RegistrarBloc, RegistrarState>(builder: (_, state) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                  icon: Icons.person,
                  labelText: 'Nombre completo',
                  hintText: 'Juan López Pérez',
                  errorText: state.errorName,
                  fn: (value) {
                    controller.name(value);
                    return controller.validarName(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    icon: Icons.email,
                    labelText: 'Correo electronico',
                    hintText: 'juan55@gmail.como',
                    errorText: state.errorEmail,
                    fn: (value) {
                      controller.email(value);
                      return controller.validarEmail(value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    icon: Icons.phone,
                    labelText: 'Numero de telefono',
                    hintText: '9191728149',
                    errorText: state.errorTelefono,
                    fn: (value) {
                      controller.telefono(value);
                      return controller.validarTelefono(value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    icon: Icons.work,
                    labelText: 'Cargo',
                    hintText: 'Docente',
                    errorText: state.errorCargo,
                    fn: (value) {
                      controller.cargo(value);
                      return controller.validarCargo(value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    icon: Icons.password,
                    labelText: 'Password',
                    obscureText: true,
                    errorText: state.errorPassword,
                    fn: (value) {
                      controller.password(value);
                      return controller.validarPassword(value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    icon: Icons.password,
                    labelText: 'Repetir contraseña',
                    obscureText: true,
                    errorText: state.errorRepeatPassword,
                    fn: (value) {
                      controller.repeatPassword(value);
                      return controller.validarRepeatPassword(
                          repeatPassword: value);
                    }),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: !controller.botonActivo()
                      ? null
                      : () => controller.registrarUser(),
                  child: const Text('Registrar'),
                ),
                SizedBox(
                  height: 100,
                  child: Text(state.message),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
