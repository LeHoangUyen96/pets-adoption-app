import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Category extends Equatable {
  final int id;
  final String icons;
  final String type;

  Category({
    @required this.id,
    this.icons,
    this.type,
  });
  factory Category.initialState() {
    return Category(
      id: 0,
      icons: '',
      type: '',
    );
  }
  Category copyWith({
    int id,
    String icons,
    String type,
  }) {
    return Category(
      id: id ?? this.id,
      icons: icons ?? this.icons,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [id, icons, type];
}
