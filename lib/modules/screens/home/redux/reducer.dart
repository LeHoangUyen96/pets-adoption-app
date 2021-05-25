import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/models/card.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/action.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux_thunk/redux_thunk.dart';

Cart cartReducer(Cart state, dynamic action) {
  if (action is SetProducts) {
    return onSetProduct(state, action);
  }

  if (action is SetProductsSearch) {
    return onSetProductSearch(state, action);
  }
  if (action is SetKeyword) {
    return onSetKeyword(state, action);
  }
  if (action is SetIsFavorites) {
    return onSetIsFavorite(state, action);
  }
  return state;
}

Cart onSetProduct(Cart state, SetProducts action) {
  state = state.copyWith(
    product: action.products,
  );
  return state;
}

Cart onSetProductSearch(Cart state, SetProductsSearch action) {
  state = state.copyWith(
    productsearch: action.products,
  );
  return state;
}

Cart onSetKeyword(Cart state, SetKeyword action) {
  state = state.copyWith(
    keyword: action.keyword,
  );
  return state;
}

Cart onSetIsFavorite(Cart state, SetIsFavorites action) {
  final List<Product> newProducts = [...state.product];
  int favoritesIndex =
      newProducts.indexWhere((product) => product.id == action.id);
  final product =
      newProducts[favoritesIndex].copyWith(isFavorite: action.isFavorite);
  newProducts[favoritesIndex] = product;
  state = state.copyWith(product: newProducts);
  return state;
}

ThunkAction<AppState> searchProductAction() {
  return (store) async {
    try {
      final List<Product> productlist = [];
      String keyword = store.state.cart.keyword;
      final List<Product> searchlist = store.state.cart.product;
      for (final Product product in searchlist) {
        if (product.name.toLowerCase().contains(keyword.trim().toLowerCase())) {
          productlist.add(product);
        }
      }
      await store.dispatch(SetProductsSearch(productlist));
    } catch (e) {
      print(e);
    }
  };
}
