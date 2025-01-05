import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/homw_model.dart';
import 'package:online_shop/data/services/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService homeService;
  HomeBloc(this.homeService) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        try {
          emit(HomeLoadingState());
          var respnse = await homeService.getGeneralInfo();
          emit(
            HomeSuccessState(homeModel: respnse),
          );
        } catch (e) {
          emit(
            HomeErrorState(error: 'خطا نامشخص'),
          );
        }
      }
    });
  }
}
