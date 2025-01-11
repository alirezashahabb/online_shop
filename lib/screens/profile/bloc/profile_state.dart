part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class UserCommentLoadingState extends ProfileState {}

final class UserCommentSuccessState extends ProfileState {
  final List<UserCommentModel> userComment;

  UserCommentSuccessState({required this.userComment});
}

final class UserCommentErrorState extends ProfileState {
  final String error;

  UserCommentErrorState({required this.error});
}
