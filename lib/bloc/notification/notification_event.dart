part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
  @override
  List<Object> get props => [];
}

class NotificationsGetEvent extends NotificationEvent {
  const NotificationsGetEvent();
}

class NotificationInitialiceEvent extends NotificationEvent {
  final String email;
  const NotificationInitialiceEvent({required this.email});
}

class NotificationAddEvent extends NotificationEvent {
  final NotificacionModel item;
  const NotificationAddEvent({required this.item});
}

class NotificationCleanEvent extends NotificationEvent {
  const NotificationCleanEvent();
}
