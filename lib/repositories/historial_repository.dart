// import 'package:flutter_application_5/models/prestamo.dart';

import '../models/historial_model.dart';
import '../models/material_model.dart';
import '../models/prestamo.dart';
import '../services/mysql/connection.dart';

class HistorialRepository {
  Future<List<HistorialModel>> findHistorial(String email) {
    Connection ms = Connection();
    return ms.getHistorial(email);
  }
}

class HistorialRepositoryAdmin {
  Future<List<PrestamoModel>> findHistorialAdmin() {
    Connection mysqlService = Connection();
    return mysqlService.getAllHistorial();
  }

  Future<List<PrestamoModel>> newPrestamos() {
    Connection mysqlService = Connection();
    return mysqlService.nuevosPrestamos();
  }

  void aceptarPrestamo(PrestamoModel prestamo) {
    Connection mysqlService = Connection();
    mysqlService.acceptPrestamo(prestamo.id);
    mysqlService.insertNotificacionPermitido(prestamo.email, prestamo.material);
    return;
  }

  void rechazarPrestamo(PrestamoModel prestamo) {
    Connection mysqlService = Connection();
    mysqlService.declinePrestamo(prestamo.id);
    mysqlService.insertNotificacionRechazado(prestamo.email, prestamo.material);
    return;
  }

  Future<List<MaterialM>> allMaterial() {
    Connection mysqlService = Connection();
    return mysqlService.getAllMateriales();
  }

  void addNewMaterial(MaterialM material) {
    Connection mysqlService = Connection();
    mysqlService.addMaterial(material);
    return;
  }
}
