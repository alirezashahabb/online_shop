part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

class BasketItemInitEvent extends BasketEvent {
  final int productId;

  BasketItemInitEvent({required this.productId});
}

// Get Basket Items

class GetBasketInitEvent extends BasketEvent {}
