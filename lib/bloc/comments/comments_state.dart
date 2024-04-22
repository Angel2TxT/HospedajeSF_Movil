part of 'comments_bloc.dart';

class CommentsState extends Equatable {
  final List<CommentModel> commentsList;

  const CommentsState({
    required this.commentsList,
  });

  @override
  List<Object> get props => [
    commentsList,
  ];
}