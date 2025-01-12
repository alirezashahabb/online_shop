import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/services/basket_service.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketService basketService;
  BasketBloc(this.basketService) : super(BasketInitial()) {
    on<BasketEvent>((event, emit) async {
      if (event is BasketItemInit) {
        emit(BasketLoadingState());
        try {
          await basketService.addBasket(event.productId);
          emit(BasketSuccessState());
        } catch (e) {
          emit(BasketErrorState(error: ''));
        }
      }
    });
  }
}
