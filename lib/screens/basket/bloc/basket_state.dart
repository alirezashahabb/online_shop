part of 'basket_bloc.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

class BasketSuccessState extends BasketState {}

class BasketLoadingState extends BasketState {}

class BasketErrorState extends BasketState {
  final String error;

  BasketErrorState({
    required this.error,
  });
}

// Get Basket Items
class GetBasketLoading extends BasketState {}

class GetBasketSuccessState extends BasketState {
  final BasketModel basketModel;

  GetBasketSuccessState({
    required this.basketModel,
  });
}

class GetBasketErrorState extends BasketState {
  final String error;

  GetBasketErrorState({
    required this.error,
  });
}
