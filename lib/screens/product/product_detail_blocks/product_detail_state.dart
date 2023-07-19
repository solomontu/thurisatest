import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:thurisatest/models/product_detail_model.dart';


@immutable
abstract class ProductDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadingState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoadedState extends ProductDetailState {
  ProductDetailLoadedState(this.productLoaded);

  final ProductDetailModel? productLoaded;

  @override
  List<Object?> get props => [productLoaded];
}

class ProductDetailErrorState extends ProductDetailState {
  ProductDetailErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class ProductDetailEmptyState extends ProductDetailState {
  final String empty;

  ProductDetailEmptyState(this.empty);

  @override
  // TODO: implement props
  List<Object?> get props => [empty];
}
