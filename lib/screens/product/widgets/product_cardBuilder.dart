import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thurisatest/constants/string_constants.dart';
import 'package:thurisatest/screens/product/product_blocs/product_bloc.dart';
import 'package:thurisatest/screens/product/product_blocs/product_events.dart';
import 'package:thurisatest/screens/product/product_blocs/product_state.dart';
import 'package:thurisatest/screens/product/widgets/product_card.dart';

class ProductSBuilder extends StatelessWidget {
  const ProductSBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(const LoadProductEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: Text(AppString.loading),
            );
          } else if (state is ProductLoadedState) {
            var product = state.productLoaded;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel: product[index],
                );
              },
            );
          } else if (state is ProductErrorState) {
            return const Center(
              child: Text(AppString.errorLoadingProduct),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
