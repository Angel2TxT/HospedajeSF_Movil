part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final List<NotificacionModel> lstNotificaciones;

  const NotificationState({
    required this.lstNotificaciones,
  });

  NotificationState add(NotificacionModel item) {
    lstNotificaciones.add(item);
    return this;
  }

  @override
  List<Object> get props => [
        lstNotificaciones,
      ];
}
