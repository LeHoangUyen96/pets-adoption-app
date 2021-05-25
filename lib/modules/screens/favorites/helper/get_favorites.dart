import 'package:pets_adoption_app_ui/modules/models/product.dart';

List<Product> getFavorites(List<Product> products) {
  final List<Product> favorites = [];
  products.forEach((product) {
    if (product.isFavorite) {
      favorites.add(product);
    }
  });
  return favorites;
}
