import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/models/product/product_model.dart';
import 'package:inventory_manager/services/product_service.dart';
import 'package:inventory_manager/services/remote_files_service.dart';

// part 'add_product_controller.freezed.dart';

final productNotifierProvider = StateNotifierProvider<ProductNotifier>((ref) {
  return ProductNotifier(ref.read);
});

final productProvider = Provider<Product>((ref) {
  final productState = ref.watch(productNotifierProvider.state);
  return productState;
});

class ProductNotifier extends StateNotifier<Product> {
  final Reader read;

  ProductNotifier(this.read, [Product? product])
      : super(product ?? Product.loading());

  void getProduct({required String? id}) async {
    if (id == null) {
      var data = ProductModel.create();
      state = Product.data(data);
      return;
    }

    final result = await ProductService.getProduct(id: id);
    if (result != null) {
      state = Product.data(result);
    } else {
      print('erro');
      // state = Product.error(e, s);
    }
  }

  void setImage(String imagePath) async {
    var result =
        await RemoteFilesService.saveProductImage(imagePath: imagePath);
    if (result != null) {
      state.maybeWhen(
        data: (data) {
          state = Product.data(data.copyWith(image: result));
        },
        orElse: () {},
      );
    }
  }

  void changeName(String value) {
    state.maybeWhen(
      data: (data) {
        state = Product.data(data.copyWith(name: value));
      },
      orElse: () {},
    );
  }

  void setBarcode(String value) {
    state.maybeWhen(
      data: (data) {
        state = Product.data(data.copyWith(barcode: value));
      },
      orElse: () {},
    );
  }
}
