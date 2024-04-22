part of 'prestamos_bloc.dart';

class PrestamosState extends Equatable {
  final List<PrestamoModel> listaNuevos;

  const PrestamosState({
    required this.listaNuevos,
  });

  PrestamosState removeItem(PrestamoModel item) {
    listaNuevos.remove(item);
    // if (listaNuevos.length == 0) {
    //   print('hola?');
    //   // listaNuevos == [];
    //   listaNuevos == [];
    // }
    return PrestamosState(listaNuevos: listaNuevos);
  }

  @override
  List<Object> get props => [listaNuevos];
}
