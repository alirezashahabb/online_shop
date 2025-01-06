part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

// Latest Product
final class ProductLatestLoadingState extends ProductState {}

final class ProductLatestSuccessState extends ProductState {
  final ProductModel productModel;

  ProductLatestSuccessState({required this.productModel});
}

final class ProductLatestErrorState extends ProductState {
  final String error;

  ProductLatestErrorState({required this.error});
}

// Popular Product

// Latest Product
final class ProductPopularLoadingState extends ProductState {}

final class ProductPopularSuccessState extends ProductState {
  final ProductModel productModel;

  ProductPopularSuccessState({required this.productModel});
}

final class ProductPopularErrorState extends ProductState {
  final String error;

  ProductPopularErrorState({required this.error});
}
