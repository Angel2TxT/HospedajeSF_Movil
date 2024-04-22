// import 'package:prueba/services/authentication_queries.dart';

import '../models/user.dart';
import '../models/user_credential.dart';
// import '../services/Connection.dart';
import '../services/mysql/authentication_queries.dart';

class AuthenticationRepository {
  Future<UserCredential?> signIn(User user) async {
    AuthenticationQueries ms = AuthenticationQueries();
    return await ms.getUsuario(user.email, user.pass);
    // return UserCredential(
    //     email: 'feliciano@gmail.com',
    //     firstName: 'Feliciano',
    //     lastName: 'Rodríguez',
    //     type: 'usuario');
  }
}
