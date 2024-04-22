part of 'historial_bloc.dart';

abstract class HistorialEvent extends Equatable {
  const HistorialEvent();
  @override
  List<Object> get props => [];
}

class HistorialInitializeEvent extends HistorialEvent {
  final String email;
  const HistorialInitializeEvent({required this.email});
}

class HistorialAddEvent extends HistorialEvent {
  final HistorialModel item;
  const HistorialAddEvent({required this.item});
}

class HistorialCleanEvent extends HistorialEvent {
  const HistorialCleanEvent();
}
