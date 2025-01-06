part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductLatestInitEvent extends ProductEvent {}

class ProductPopularInitEvent extends ProductEvent {}
