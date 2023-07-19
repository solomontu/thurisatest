import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:thurisatest/screens/product/product_detail_blocks/product_detail_event.dart';
import 'package:thurisatest/screens/product/product_detail_blocks/product_detail_state.dart';
import 'package:thurisatest/services/repository/product_repository.dart';

import '../../../models/product_detail_model.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvents, ProductDetailState> {

final    ProductRepository productRepository;
  ProductDetailBloc({required this.productRepository})
      : super(ProductDetailLoadingState()) {

    ProductDetailModel? result;
    on<LoadProductDetailEvent>((event, emit) async {
      try {
        result = await productRepository.getProductsDetail(event.id!);
        if (result != null) {
          emit(ProductDetailLoadedState(result));
        } else {
          emit(ProductDetailEmptyState('No result found'));
        }
      } catch (err) {
        emit(ProductDetailErrorState(err.toString()));
      }
    });
  }
}
