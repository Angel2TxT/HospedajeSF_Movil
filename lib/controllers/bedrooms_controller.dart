import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bedroom/bedroom_bloc.dart';
import '../bloc/bedrooms/bedrooms_bloc.dart';

class BedroomsController {
  final BuildContext context;
  late final BedroomsBloc bedroomsBloc;
  late final BedroomBloc bedroomBloc;
  
  BedroomsController({required this.context}) {
    bedroomsBloc = BlocProvider.of<BedroomsBloc>(
      context,
      listen: false,
    );
    bedroomBloc = BlocProvider.of<BedroomBloc>(
      context,
      listen: false,
    );
  }

  void getBedrooms(int id) {
    bedroomsBloc.add(BedroomsGetForIdEvent(id: id));
    Navigator.pushNamed(context, 'bedrooms_admin');
  }

  void getBedroomsSeller(int id) {
    bedroomsBloc.add(BedroomsGetForIdEvent(id: id));
    Navigator.pushNamed(context, 'bedrooms_seller');
  }

  void getBedroom(int id) {
    // bedroomsBloc.add(BedroomsGetForIdEvent(id: id));
    bedroomBloc.add(BedroomsGetEvent(id: id));
    Navigator.pushNamed(context, 'room_details_client');
  }
}