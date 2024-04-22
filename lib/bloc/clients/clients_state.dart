part of 'clients_bloc.dart';

class ClientsState extends Equatable {
  final List<ClientModel> clientsList;

  const ClientsState({
    required this.clientsList,
  });

  @override
  List<Object> get props => [
    clientsList,
  ];
}