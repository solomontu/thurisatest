

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductDetailEvents extends Equatable {
  const ProductDetailEvents();
  @override
  List<Object?> get props => [];
}

class LoadProductDetailEvent extends ProductDetailEvents {
  final int? id;

  const LoadProductDetailEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
