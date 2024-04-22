part of 'clients_bloc.dart';

abstract class ClientsEvent extends Equatable {
  const ClientsEvent();
  
  @override
  List<Object> get props => [];
}

class ClientsGetAllEvent extends ClientsEvent {
  const ClientsGetAllEvent();
}
