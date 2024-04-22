import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form_login/form_login_bloc.dart';
import '../controllers/login_controller.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController(context: context);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<FormLoginBloc, FormLoginState>(builder: (_, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xff306998),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                height: 160.0,
                child: const Text(
                  "Hotel San Felipe de Jesús",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children:  [
                        const SizedBox(height: 25),
                        const Text(
                          "Iniciar Sesión",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/img/icono.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                      child: SizedBox(
                          height: 30, child: Text(state.msgResponse)),
                    ),
                        Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 0, right: 10),
                        child: Container(
                          child: TextFormField(
                            onChanged: (value) => controller.changeEmail(value),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: const Icon(Icons.abc),
                              errorText: state.errorEmail == ''
                                  ? null
                                  : state.errorEmail,
                              labelText: 'Usuario',
                              hintText: 'jose1234_',
                              hintStyle:
                                  GoogleFonts.raleway(color: Colors.grey),
                              contentPadding:
                                  const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                              // enabledBorder: const UnderlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.green, width: 2.0),
                              // ),
                              // focusedBorder: const UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Color(0xff00a88c), width: 1.0),
                              // ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: Container(
                          child: TextFormField(
                            obscureText: true,
                            //-------------------------------
                            onChanged: (value) =>
                                controller.changePassword(value),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              icon: const Icon(Icons.password),
                              errorText: state.msgPassword == ''
                                  ? null
                                  : state.msgPassword,
                              labelText: 'Contraseña',
                              hintText: 'Contraseña',
                              hintStyle:
                                  GoogleFonts.raleway(color: Colors.grey),
                              contentPadding:
                                  const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                              // enabledBorder: const UnderlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.green, width: 2.0),
                              // ),
                              // focusedBorder: const UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Color(0xff00a88c), width: 1.0),
                              // ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffbe145),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            controller.signIn();
                          },
                          child: Text(
                            'Iniciar sesión',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
                    
 
            ],
          ),
        );
      },),
    );
  }
}
