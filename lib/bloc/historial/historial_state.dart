part of 'historial_bloc.dart';

class HistorialState extends Equatable {
  final List<HistorialModel> lstHistorial;

  const HistorialState({
    required this.lstHistorial,
  });

  HistorialState add(HistorialModel item) {
    lstHistorial.add(item);
    return this;
  }

  @override
  List<Object> get props => [
        lstHistorial,
      ];
}
