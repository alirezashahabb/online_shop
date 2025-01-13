import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/basket_model.dart';
import 'package:online_shop/data/services/basket_service.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketService basketService;
  BasketBloc(this.basketService) : super(BasketInitial()) {
    on<BasketEvent>(
      (event, emit) async {
        if (event is BasketItemInitEvent) {
          emit(BasketLoadingState());
          try {
            await basketService.addBasket(event.productId);
            emit(BasketSuccessState());
          } catch (e) {
            emit(BasketErrorState(error: 'خطل نامشخص'));
          }
        }
        // Get Basket
        if (event is GetBasketInitEvent) {
          emit(GetBasketLoading());
          try {
            var response = await basketService.getAllBasket();
            emit(
              GetBasketSuccessState(
                basketModel: response,
              ),
            );
          } catch (e) {
            emit(GetBasketErrorState(error: 'خطانامشخص'));
          }
        }
        //Increment
        if (event is IncrementBasketInitEvent) {
          emit(BasketIncrementLoadingState());
          try {
            await basketService.increaseCount(event.productId);
            emit(BasketIncrementSuccessState());
          } catch (e) {
            emit(BasketIncrementErrorState(error: 'خطانامشخص'));
          }
        }
        //Decrement
        if (event is DecrementBasketInitEvent) {
          emit(BasketDecrementLoadingState());
          try {
            await basketService.decreesCount(event.productId);
            emit(BasketDecrementSuccessState());
          } catch (e) {
            emit(
              BasketDecrementErrorState(error: 'خطانامشخص'),
            );
          }
        }
        //deleted
        if (event is DeletedBasketInitEvent) {
          emit(BasketDeletedLoadingState());
          try {
            await basketService.removeProductsFromBasket(event.productId);
            emit(BasketDeletedSuccessState());
          } catch (e) {
            emit(
              BasketDeletedErrorState(error: 'خطانامشخص'),
            );
          }
        }
      },
    );
  }
}
