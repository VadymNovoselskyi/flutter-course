import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod_state/models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product newProduct) {
    if (state.contains(newProduct)) return;

    state = {...state, newProduct};
  }

  void removeProduct(Product product) {
    if (!state.contains(product)) return;

    state = state.where((p) => p.id != product.id).toSet();
  }
}

@riverpod
int cartTotal(Ref ref) {
  return ref.watch(cartProvider).fold(0, (value, p) => value += p.price);
}
