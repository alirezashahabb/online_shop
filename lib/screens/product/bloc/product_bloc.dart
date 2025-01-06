import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/model/product_model.dart';
import 'package:online_shop/data/services/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;
  ProductBloc(this.productService) : super(ProductLatestLoadingState()) {
    on<ProductEvent>(
      (event, emit) async {
        // product latest
        if (event is ProductLatestInitEvent) {
          emit(ProductLatestLoadingState());
          try {
            var response = await productService.getLatestProduct();
            emit(ProductLatestSuccessState(productModel: response));
          } catch (e) {
            emit(
              ProductLatestErrorState(error: 'خطانامشخص'),
            );
          }
        }
        // product latest
        if (event is ProductPopularInitEvent) {
          emit(ProductPopularLoadingState());
          try {
            var response = await productService.getPopularProduct();
            emit(ProductPopularSuccessState(productModel: response));
          } catch (e) {
            emit(
              ProductPopularErrorState(error: 'خطانامشخص'),
            );
          }
        }
      },
    );
  }
}
