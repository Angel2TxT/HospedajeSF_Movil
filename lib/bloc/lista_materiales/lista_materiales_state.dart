part of 'lista_materiales_bloc.dart';

class ListaMaterialesState extends Equatable {
  final List<MaterialM> listaMaterial;

  const ListaMaterialesState({
    required this.listaMaterial,
  });

  @override
  List<Object> get props => [listaMaterial];
}
