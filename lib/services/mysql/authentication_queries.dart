import 'package:flutter_bcrypt/flutter_bcrypt.dart';

import '../../models/user_credential.dart';
import 'connection.dart';

class AuthenticationQueries {
  var db = Connection();

  Future<UserCredential?> getUsuario(String username, String password) async {
    UserCredential? credential;
    var connection = await db.getConnection();
    bool password_check = false;
    var results = await connection.query('''
SELECT empleados.nombre, 
empleados.user_name, 
cat_roles.tipo,
empleados.contrasenia
FROM empleados
LEFT JOIN cat_roles
ON empleados.fk_rol = cat_roles.id_rol
      WHERE empleados.user_name = "${username}"
    ''');


    for (var row in results) {
      try {
        password_check = await FlutterBcrypt.verify(
          password: password,
          hash: row[3].toString(),
        );
      } catch (e) {
        print("Error con el método de verificación.");
      }

    if (password_check) {
      credential = UserCredential(name: row[0], username: row[1], cargo: row[2]);
    } else {
      print("Contraseña incorrecta.");
    }
    }
    return credential;
  }
}