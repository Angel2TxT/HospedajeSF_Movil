part of 'lista_materiales_bloc.dart';

abstract class ListaMaterialesEvent extends Equatable {
  const ListaMaterialesEvent();

  @override
  List<Object> get props => [];
}

class ListaMaterialesInitialiceEvent extends ListaMaterialesEvent {
  const ListaMaterialesInitialiceEvent();
}

class ListaMaterialesCleanEvent extends ListaMaterialesEvent {
  const ListaMaterialesCleanEvent();
}
