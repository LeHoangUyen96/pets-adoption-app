import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Product extends Equatable {
  final int id;
  final String image;
  final String name;
  final double age;
  final bool isFemale;
  final String address;
  final String species;
  final Color color;
  final bool isFavorite;
  final String description;

  Product(
      {@required this.id,
      this.image,
      this.name,
      this.age,
      this.isFemale,
      this.address,
      this.species,
      this.color,
      this.isFavorite,
      this.description});
  factory Product.initialState() {
    return Product(
      id: 0,
      image: '',
      name: '',
      age: 0,
      isFemale: true,
      address: '',
      species: '',
      isFavorite: true,
      description: '',
    );
  }

  get product => null;
  Product copyWith({
    int id,
    String image,
    String name,
    double age,
    bool isFemale,
    String address,
    String species,
    Color color,
    bool isFavorite,
    String description,
  }) {
    return Product(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        age: age ?? this.age,
        isFemale: isFemale ?? this.isFemale,
        address: address ?? this.address,
        species: species ?? this.species,
        color: color ?? this.color,
        isFavorite: isFavorite ?? this.isFavorite,
        description: description ?? this.description);
  }

  @override
  List<Object> get props => [
        id,
        image,
        name,
        age,
        isFemale,
        address,
        species,
        color,
        isFavorite,
        description
      ];
}
