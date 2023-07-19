

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductEvents extends Equatable {
  const ProductEvents();
  @override
  List<Object?> get props => [];
}

class LoadProductEvent extends ProductEvents {
  final Map<String, dynamic>? queryParams;

  const LoadProductEvent({this.queryParams});
  @override
  List<Object?> get props => [queryParams];
}
