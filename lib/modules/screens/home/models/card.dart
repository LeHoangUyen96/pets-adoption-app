import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets_adoption_app_ui/constants/productConstants.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';

class Cart extends Equatable {
  final List<Product> product;
  final List<Product> productsearch;
  final String keyword;
  final bool isFavorite;
  final int id;

  Cart(
      {@required this.product,
      this.productsearch,
      this.keyword,
      this.isFavorite,
      this.id});

  factory Cart.initialState() {
    return Cart(
        product: products,
        productsearch: [],
        keyword: '',
        isFavorite: false,
        id: 0);
  }

  Cart copyWith(
      {List<Product> product,
      List<Product> productsearch,
      String keyword,
      bool isFavorite,
      int id}) {
    return Cart(
      product: product ?? this.product,
      productsearch: productsearch ?? this.productsearch,
      keyword: keyword ?? this.keyword,
      isFavorite: isFavorite ?? this.isFavorite,
      id: id ?? this.id,
    );
  }

  List<Object> get props => [
        product,
        productsearch,
        keyword,
        isFavorite,
        id,
      ];

  static initial() {}
}
