// import 'package:hospedaje_san_felipe_de_jesus/models/bedroom_model.dart';
import 'package:mysql1/mysql1.dart';

import '../../models/UserRegister.dart';
// import '../models/bedroom_model.dart';
import '../../models/historial_model.dart';
import '../../models/material_model.dart';
import '../../models/notificacion_model.dart';
import '../../models/prestamo.dart';
import '../../models/user_credential.dart';

class Connection {
  static String host = '162.241.62.45',
      user = 'techstit_hospedaje',
      password = 'Ho\$pedaje2024',
      // password = 'Hola\$Mundo',
      db = 'techstit_HospedajeSanFelipe';
  static int port = 3306;

  Connection();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host,
        port: port,
        user: user,
        password: password,
        db: db);
    return await MySqlConnection.connect(settings);
  }

  //-----------------------------------





  // Future<List<PrestamoModel>> getAllHistorial() async {
  //   List<PrestamoModel> listaHistorial = [];
  //   var conexion = await getConnection();
  //   var resultados = await conexion.query('''
  //     SELECT prestamos.id, users.name, users.email, prestamos.fecha_de_salida, prestamos.fecha_de_entrega, estados.estado, materiales.descripcion1, materiales.cantidad
  //     FROM prestamos
  //     LEFT JOIN users
  //     ON prestamos.id_user = users.id
  //     LEFT JOIN estados
  //     ON prestamos.id_estados = estados.id
  //     LEFT JOIN materiales
  //     ON prestamos.id_materiales = materiales.id
  //     order by prestamos.id
  //   ''');

  //   for (var row in resultados) {
  //     listaHistorial.add(PrestamoModel(
  //       id: row[0],
  //       name: row[1].toString(),
  //       email: row[2].toString(),
  //       fechaSalida: row[3].toString(),
  //       fechaEntrega: row[4].toString(),
  //       status: row[5].toString(),
  //       material: row[6].toString(),
  //       cantidad: row[7],
  //     ));
  //   }
  //   return listaHistorial;
  // }
    Future<List<PrestamoModel>> getAllHistorial() async {
    List<PrestamoModel> listaHistorial = [];
    var conexion = await getConnection();
    var resultados = await conexion.query('''
      SELECT * FROM habitaciones;
    ''');

    for (var row in resultados) {
      listaHistorial.add(PrestamoModel(
        id: row[0],
        name: row[1].toString(),
        email: row[2].toString(),
        fechaSalida: row[3].toString(),
        fechaEntrega: row[4].toString(),
        status: row[5].toString(),
        material: row[6].toString(),
        cantidad: row[7],
      ));
    }
    return listaHistorial;
  }

  Future<List<HistorialModel>> getHistorial(String email) async {
    List<HistorialModel> lista = [];
    var conn = await getConnection();
    var results = await conn.query('''
      SELECT prestamos.id, prestamos.fecha_de_salida, prestamos.fecha_de_entrega, estados.estado, materiales.descripcion1, materiales.cantidad
      FROM prestamos
      LEFT JOIN users
      ON prestamos.id_user = users.id
      LEFT JOIN estados
      ON prestamos.id_estados = estados.id
      LEFT JOIN materiales
      ON prestamos.id_materiales = materiales.id
      WHERE users.email = '$email'
      order by prestamos.id DESC
    ''');

    for (var row in results) {
      lista.add(HistorialModel(
        id: row[0],
        fechaSalida: row[1].toString(),
        fechaEntrega: row[2].toString(),
        status: row[3].toString(),
        material: row[4].toString(),
        cantidad: row[5],
      ));
    }

    return lista;
  }

  Future<List<NotificacionModel>> getNotifications(String email) async {
    List<NotificacionModel> notificacion = [];
    var conn = await getConnection();
    var results = await conn
        .query("select id, mensaje from notificacion where idUser = '$email'");

    for (var row in results) {
      notificacion.add(NotificacionModel(
        id: row[0],
        mensaje: row[1],
      ));
      deleteNotification(row[0]);
    }
    return notificacion;
  }

  void deleteNotification(int id) async {
    var conn = await getConnection();
    await conn.query("delete from notificacion where id = '$id'");
  }

  Future<List<PrestamoModel>> nuevosPrestamos() async {
    List<PrestamoModel> listaNuevos = [];
    var conexion = await getConnection();
    var resultados = await conexion.query('''
      SELECT prestamos.id, users.name, users.email, prestamos.fecha_de_salida, prestamos.fecha_de_entrega, estados.estado, materiales.descripcion1, materiales.cantidad
      FROM prestamos
      LEFT JOIN users
      ON prestamos.id_user = users.id
      LEFT JOIN estados
      ON prestamos.id_estados = estados.id
      LEFT JOIN materiales
      ON prestamos.id_materiales = materiales.id
      WHERE estados.estado = 'Nuevo'
    ''');

    for (var row in resultados) {
      listaNuevos.add(PrestamoModel(
        id: row[0],
        name: row[1].toString(),
        email: row[2].toString(),
        fechaSalida: row[3].toString(),
        fechaEntrega: row[4].toString(),
        status: row[5].toString(),
        material: row[6].toString(),
        cantidad: row[7],
      ));
    }
    return listaNuevos;
  }

  void insertNotificacionPermitido(String email, String material) async {
    var conexion = await getConnection();
    var resultado = await conexion.query('''
      INSERT INTO notificacion(idUser, mensaje) 
      VALUES('$email', 'La solicitud de $material a sido permitido')
    ''');
  }

  void insertNotificacionRechazado(String email, String material) async {
    var conexion = await getConnection();
    var resultado = await conexion.query('''
      INSERT INTO notificacion(idUser, mensaje) 
      VALUES('$email', 'La solicitud de $material a sido rechazada...Una disculpa')
    ''');
  }

  void acceptPrestamo(int id) async {
    var conexion = await getConnection();
    var resultado = await conexion.query('''
      UPDATE prestamos 
      SET id_estados = 2
      WHERE id = $id
    ''');
    return null;
  }

  void declinePrestamo(int id) async {
    var conexion = await getConnection();
    var resultado = await conexion.query('''
      UPDATE prestamos 
      SET id_estados = 3
      WHERE id = $id
    ''');
    return null;
  }

  //RegistrarUser
  Future<UserRegister?> getUser(UserRegister user) async {
    final String name = user.name;
    final String email = user.email;

    var conexion = await getConnection();
    var resultado = await conexion.query('''
        SELECT name, email, password, telefono, cargo
        FROM users
        WHERE name = '$name' AND email = '$email'
      ''');

    return resultado.isNotEmpty
        ? UserRegister(
            name: resultado.first['name'].toString(),
            email: resultado.first['email'].toString(),
            telefono: resultado.first['telefono'].toString(),
            cargo: resultado.first['cargo'].toString(),
            password: resultado.first['password'].toString(),
          )
        : null;
  }

  Future<int?> registerUser(UserRegister user) async {
    final name = user.name;
    final email = user.email;
    final telefono = user.telefono;
    final cargo = user.cargo;
    final password = user.password;

    var conexion = await getConnection();
    var resultado = await conexion.query('''
      INSERT INTO users(name, email, password, telefono, cargo)
      VALUES('$name', '$email', '$password', '$telefono', '$cargo')
    ''');

    return null;
  }

  //Consulta de un modulo que tenda relacion con la funcionalidad principal
  Future<List<MaterialM>> getAllMateriales() async {
    List<MaterialM> listaMateriales = [];
    var conexion = await getConnection();
    var resultado = await conexion.query('''
        SELECT descripcion1, cantidad, marca, modelo, serie, observaciones, no_inventario, ubicacion
        FROM materiales
      ''');

    for (var row in resultado) {
      listaMateriales.add(
        MaterialM(
          nombre: row[0].toString(),
          cantidad: row[1],
          marca: row[2].toString(),
          modelo: row[3].toString(),
          serie: row[4].toString(),
          observaciones: row[5].toString(),
          nInventario: row[6],
          ubicacion: row[7].toString(),
        ),
      );
    }

    return listaMateriales;
  }

  Future<MaterialM?> addMaterial(MaterialM material) async {
    final String nombre = material.nombre;
    final int cantidad = material.cantidad;
    final String marca = material.marca;
    final String modelo = material.modelo;
    final String serie = material.serie;
    final String observaciones = material.observaciones;
    final int nInventario = material.nInventario;
    final String ubicacion = material.ubicacion;

    var conexion = await getConnection();
    var resultado = await conexion.query('''
      INSERT INTO materiales(descripcion1, cantidad, marca, modelo, serie, observaciones, no_inventario, ubicacion)
      VALUES('$nombre', '$cantidad', '$marca', '$modelo', '$serie', '$observaciones', '$nInventario', '$ubicacion')
    ''');

    return null;
  }
}
