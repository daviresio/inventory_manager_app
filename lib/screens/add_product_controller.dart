import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/services/remote_files_service.dart';
import 'package:uuid/uuid.dart';

// part 'add_product_controller.freezed.dart';

final productNotifierProvider = StateNotifierProvider<ProductNotifier>((ref) {
  return ProductNotifier(ref.read);
});

final productProvider = Provider<Product>((ref) {
  final productState = ref.watch(productNotifierProvider.state);
  return productState;
});

class ProductNotifier extends StateNotifier<Product> {
  ProductNotifier(this.read, [Product? product])
      : super(product ?? Product.loading());

  final Reader read;

  getProduct({required String? idProduct}) {
    if (idProduct == null) {
      var data = ProductModel(
        id: Uuid().v4(),
        name: '',
        amount: 0,
        barcode: '',
        image: '',
      );
      state = Product.data(data);
      return;
    }

    try {
      final result = ProductModel(id: Uuid().v4(), name: '');
      state = Product.data(result);
    } catch (e, s) {
      state = Product.error(e, s);
    }
  }

  void setImage(String imagePath) async {
    read(productLoaderProvider).setIsLoading(true);

    var result =
        await RemoteFilesService.saveProductImage(imagePath: imagePath);
    if (result != null) {
      state.maybeWhen(data: (data) {
        print('finalmente entrei');
        var temp = data.copyWith(image: result);
        state = Product.data(temp);
      }, orElse: () {
        print('nada aqui');
      });

      // state = Product.data(newState!.value.copyWith(image: result));
      // state = AsyncValue.data(prev.data!.value.copyWith(image: result));
    }
    read(productLoaderProvider).setIsLoading(false);
  }
}

final productLoaderProvider =
    StateNotifierProvider<ProductLoading>((ref) => ProductLoading(false));

class ProductLoading extends StateNotifier<bool> {
  ProductLoading([bool? isLoading]) : super(isLoading ?? false);

  setIsLoading(bool value) {
    state = value;
  }
}
