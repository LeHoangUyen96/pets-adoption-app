import 'package:pets_adoption_app_ui/modules/models/product.dart';

class SetProducts {
  final List<Product> products;
  SetProducts(this.products);
}

class SetProductsSearch {
  final List<Product> products;
  SetProductsSearch(this.products);
}

class SetKeyword {
  final String keyword;
  SetKeyword(this.keyword);
}

class SetIsFavorites {
  final bool isFavorite;
  final int id;
  SetIsFavorites(this.isFavorite, this.id);
}
