// import 'package:mysql1/mysql1.dart';
// import 'package:prueba/models/floor_model.dart';

import '../../models/bedroom_model.dart';
import '../../models/client_model.dart';
import '../../models/comment.dart';
import '../../models/floor_model.dart';
import '../../models/notificacion_model.dart';
import '../../models/reservation.dart';
import 'connection.dart';


class BedroomsQueries {
  var db = Connection();
  
  Future<List<BedroomsModel>> getAllBedrooms() async {
    List<BedroomsModel> bedroomsList = [];
    var connection = await db.getConnection();
    var result;
    try {
      result = await connection.query('''
SELECT habitaciones.id_habitacion, 
habitaciones.no_habitacion, 
habitaciones.no_ocupantes, 
habitaciones.no_max_ocupantes, 
habitaciones.fk_piso, fk_estado, 
habitaciones.url,
cat_estados_habitaciones.descripcion 
FROM habitaciones
LEFT JOIN cat_estados_habitaciones
ON habitaciones.fk_estado = cat_estados_habitaciones.id_estado
      ''');

    }  catch (e) {
      print("Error en consultar las habitaciones");
    }

    for (var row in result) {
      bedroomsList.add(
        BedroomsModel(
          id: row[0],
          num: row[1].toString(),
          occupants: row[2],
          maxOccupants: row[3],
          floor: row[4],
          state: row[7],
          url: row[6].toString(),
        ),
      );
    }
      return bedroomsList;
  }

  Future<List<FloorModel>> consultAllFloor() async {
    List<FloorModel> floorList = [];
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT * FROM cat_pisos
    ''');


    for (var row in result) {
      floorList.add(
        FloorModel(
          id: row[0],
          description: row[1],
        ),
      );
    }

    return floorList;
  }

    Future<List<BedroomsModel>> consultBedroomsById(int id) async {
    List<BedroomsModel> bedroomsList = [];
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT habitaciones.id_habitacion, habitaciones.no_habitacion, habitaciones.no_ocupantes, 
      habitaciones.no_max_ocupantes, habitaciones.fk_piso, fk_estado, habitaciones.url_foto,
      cat_estados_habitaciones.descripcion 
      FROM habitaciones
      LEFT JOIN cat_estados_habitaciones
      ON habitaciones.fk_estado = cat_estados_habitaciones.id_estado
      WHERE habitaciones.fk_piso = $id
    ''');

    for (var row in result) {
      bedroomsList.add(
        BedroomsModel(
          id: row[0],
          num: row[1].toString(),
          occupants: row[2],
          maxOccupants: row[3],
          floor: row[4],
          state: row[7],
          url: row[6].toString(),
        ),
      );
    }
      return bedroomsList;
  }

    Future<List<CommentModel>> consultAllComments() async {
    List<CommentModel> commentsList = [];
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT comentarios.id_comentario, comentarios.comentario, 
      clientes.nombre, 
      empleados.nombre
      FROM comentarios
      LEFT JOIN clientes
      ON comentarios.fk_cliente = clientes.id_cliente
      LEFT JOIN empleados
      ON comentarios.fk_empleado = empleados.id_empleado
    ''');


    for (var row in result) {
      commentsList.add(
        CommentModel(
          id: row[0],
          comment: row[1],
          client: row[2],
          employee: row[3],
        ),
      );
    }
    
    return commentsList;
  }

  Future<List<ClientModel>> consultAllClient() async {
    List<ClientModel> clientsList = [];
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT * FROM clientes
    ''');

    for(var row in result) {
      clientsList.add(
        ClientModel(
          id: row[0],
          name: row[1],
          lastName1: row[2],
          lastName2: row[3],
          phone: row[4],
          state: row[5],
          city: row[6],
        ),
      );
    }

    return clientsList;
  }

      Future<BedroomsModel> consultOneBedroomsById(int id) async {
    BedroomsModel bedroom;
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT habitaciones.id_habitacion, habitaciones.no_habitacion, habitaciones.no_ocupantes, 
      habitaciones.no_max_ocupantes, habitaciones.fk_piso, fk_estado, habitaciones.url_foto,
      cat_estados_habitaciones.descripcion 
      FROM habitaciones
      LEFT JOIN cat_estados_habitaciones
      ON habitaciones.fk_estado = cat_estados_habitaciones.id_estado
      WHERE habitaciones.id_habitacion = $id
    ''');

    // for (var row in result) {
    //   bedroom.add(
    //     BedroomsModel(
    //       id: row[0],
    //       num: row[1].toString(),
    //       occupants: row[2],
    //       maxOccupants: row[3],
    //       floor: row[4],
    //       state: row[7],
    //       url: row[6].toString(),
    //     ),
    //   );
    // }
    print("yess-----");
        bedroom = BedroomsModel(
        id: result.first['id_habitacion'], 
        num: result.first['no_habitacion'].toString(), 
        occupants: result.first['no_ocupantes'], 
        maxOccupants: result.first['no_max_ocupantes'], 
        floor: result.first['fk_piso'], 
        state: result.first['descripcion'], 
        url: result.first['url_foto'],
        );
        print("succesfull7");


      // return result.isNotEmpty ?
      // BedroomsModel(
      //   id: result.first['id_habitacion'], 
      //   num: result.first['no_habitacion'], 
      //   occupants: result.first['no_ocupantes'], 
      //   maxOccupants: result.first['no_max_ocupantes'], 
      //   floor: result.first['descripcion'], 
      //   state: result.first['descripcion'], 
      //   url: result.first['url_foto'],
      //   ) : null;
      return bedroom;
  }

    Future<List<NotificacionModel>> getNotifications() async {
    List<NotificacionModel> notifications = [];
    var conn = await db.getConnection();
    var results = await conn
        .query('''
      SELECT notifications.id, notifications.id_room,
      habitaciones.no_habitacion
      FROM notifications
      LEFT JOIN habitaciones
      ON habitaciones.id_habitacion = notifications.id_room
      WHERE state = "Nuevo"
        ''');

    for (var row in results) {
      String message = "Habitación número ${row[2]} reservada";
      notifications.add(NotificacionModel(
        id: row[0],
        mensaje: message,
      ));
      // deleteNotification(row[0]);
      var res = await conn.query('''
        UPDATE notifications
        SET state = 'Listo'
        WHERE id = ${row[0]}
  ''');
    }
    // notifications.add(NotificacionModel(
    //     id: 21,
    //     mensaje: "Nuevo",
    //   ));
    return notifications;
  }

  Future<List<ReservationModel>> consultAllReservations() async {
    List<ReservationModel> reservationsList = [];
    var connection = await db.getConnection();
    var result = await connection.query('''
      SELECT 
      reservaciones.id_reservacion,
      reservaciones.fecha_entrada,
      reservaciones.fecha_salida,
      reservaciones.no_personas,
      reservaciones.no_personas_extra,
      reservaciones.total,
      cat_estados_habitaciones.descripcion,
      clientes.nombre,
      empleados.nombre,
      comentarios.comentario,
      cat_precios_especiales.descripcion
      FROM reservaciones
      LEFT JOIN cat_estados_habitaciones
      ON cat_estados_habitaciones.id_estado = reservaciones.fk_id_estado
      LEFT JOIN clientes
      ON clientes.id_cliente = reservaciones.fk_id_cliente
      LEFT JOIN empleados
      ON empleados.id_empleado = reservaciones.fk_id_empleado
      LEFT JOIN comentarios
      ON comentarios.id_comentario = reservaciones.fk_id_comentario
      LEFT JOIN cat_precios_especiales
      ON cat_precios_especiales.id_precio_especial = reservaciones.fk_id_precio_especial
    ''');
    
    for (var row in result) {
      reservationsList.add(
        ReservationModel(
          id: row[0],
          date1: '${row[1]}',
          date2: '${row[2]}',
          peoples: row[3],
          extraPeoples: row[4],
          total: row[5],
          state: row[6],
          client: row[7],
          employee: row[8],
          commentary: row[9],
          specialPrice: row[10],
        ),
      );
    }

    return reservationsList;
  }
}