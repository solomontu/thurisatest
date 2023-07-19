import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:thurisatest/models/product_model.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.productLoaded);

  final List<ProductModel> productLoaded;

  @override
  List<Object?> get props => [productLoaded];
}

class ProductErrorState extends ProductState {
  ProductErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class ProductEmptyState extends ProductState {
  final String empty;

  ProductEmptyState(this.empty);

  @override
  // TODO: implement props
  List<Object?> get props => [empty];
}
