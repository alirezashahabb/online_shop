import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/user_comment_model.dart';
import 'package:online_shop/data/services/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;
  ProfileBloc(this.profileService) : super(ProfileInitialState()) {
    on<ProfileEvent>(
      (event, emit) async {
        if (event is UserCommentInitEvent) {
          emit(UserCommentLoadingState());

          try {
            var response = await profileService.getComment();
            emit(
              UserCommentSuccessState(userComment: response),
            );
          } catch (e) {
            emit(
              UserCommentErrorState(error: 'خطا نا مشخص'),
            );
          }
        }
      },
    );
  }
}
