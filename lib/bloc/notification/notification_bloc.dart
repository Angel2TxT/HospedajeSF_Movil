import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/notificacion_model.dart';
import '../../repositories/notification_repository.dart';
import '../../services/notifications_service.dart';

part 'notification_state.dart';
part 'notification_event.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository;

  NotificationBloc(this._notificationRepository)
      : super(const NotificationState(
          lstNotificaciones: [],
        )) {
    on<NotificationsGetEvent>((event, emit) async {
      List<NotificacionModel> lista =
          await _notificationRepository.findNotification();

      for (var notificacion in lista) {
        showNotificacion(id: notificacion.id, mensaje: notificacion.mensaje);
      }
      emit(NotificationState(lstNotificaciones: lista));
    });
    on<NotificationAddEvent>((event, emti) => emit(state.add(event.item)));
    on<NotificationCleanEvent>(
        (event, emit) => (const NotificationState(lstNotificaciones: [])));

  }
}
