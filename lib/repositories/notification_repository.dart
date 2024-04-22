import '../models/notificacion_model.dart';
import '../services/mysql/connection.dart';
import '../services/mysql/bedroom_queries.dart';

class NotificationRepository {
  Future<List<NotificacionModel>> findNotification() {
    BedroomsQueries ms = BedroomsQueries();
    return ms.getNotifications();
  }
}
