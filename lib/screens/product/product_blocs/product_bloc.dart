
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:thurisatest/screens/product/product_blocs/product_events.dart';
import 'package:thurisatest/screens/product/product_blocs/product_state.dart';
import 'package:thurisatest/services/repository/product_repository.dart';

import '../../../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {

  ProductRepository? productRepository=ProductRepository();
  ProductBloc() : super(ProductLoadingState()) {
    List<ProductModel> result=[];
    on<LoadProductEvent>((event, emit) async {

      try {
        result = await productRepository!.getProducts();
        if (result.isNotEmpty) {
          emit(ProductLoadedState(result));
        } else {
          emit(ProductEmptyState('No result found'));
        }
      } catch (err) {
        emit(ProductErrorState(err.toString()));
      }
    });
  }
}