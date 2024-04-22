import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/comment.dart';
import '../../models/floor_model.dart';
import '../../repositories/admin_repository.dart';
// import 'comments_state.dart';

part 'comments_state.dart';
part 'comments_event.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final AdminRepository _adminRepository;

  CommentsBloc(this._adminRepository)
      : super(const CommentsState(
          commentsList: [],
        )) {
    on<CommentsGetAllEvent>((event, emit) async {
        List<CommentModel> list = await _adminRepository.getAllComments();
      emit(CommentsState(commentsList: list));
    });
  }
}
