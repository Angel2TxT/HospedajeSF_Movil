part of 'prestamos_bloc.dart';

abstract class PrestamosEvent extends Equatable {
  const PrestamosEvent();

  @override
  List<Object> get props => [];
}

class PrestamosInitializeEvent extends PrestamosEvent {
  const PrestamosInitializeEvent();
}

class PrestamosCleanEvent extends PrestamosEvent {
  const PrestamosCleanEvent();
}

class PrestamosDeleteEvent extends PrestamosEvent {
  final PrestamoModel item;
  const PrestamosDeleteEvent({required this.item});
}

class HistorialInitializeAdminEvent extends PrestamosEvent {
  const HistorialInitializeAdminEvent();
}
