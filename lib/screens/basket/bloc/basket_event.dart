part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

class BasketItemInit extends BasketEvent {
  final int productId;

  BasketItemInit({required this.productId});
}
