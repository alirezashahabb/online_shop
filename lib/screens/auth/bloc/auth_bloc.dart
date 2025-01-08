import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/auth_model.dart';
import 'package:online_shop/data/services/auth_service.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/utils/sahre_pref_constant.dart';
import 'package:online_shop/utils/share_pref_manger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        // login
        if (event is AuthLoginEvent) {
          emit(
            AuthLoginLoadingState(),
          );
          try {
            var response = await authService.login(event.authModel);
            if (response.accessToken != null) {
              SharedPreferenceManger().saveString(
                  SharedPreferencesConstants.token, response.accessToken!);
              isLogin.value = true;
            }

            emit(
              AuthLoginSuccess(
                accessToken: response.accessToken!,
              ),
            );
          } catch (e) {
            emit(
              AuthLoginErrorState(error: 'خطایی رخ داده هست'),
            );
          }
        }
        // signUp
        if (event is AuthSignUpEvent) {
          emit(
            AuthSignUpLoadingState(),
          );
          try {
            await authService.register(event.authModel);
            emit(AuthSignUpSuccess());
          } catch (e) {
            emit(
              AuthLoginErrorState(error: 'خطایی رخ داده هست'),
            );
          }
        }
      },
    );
  }
}
