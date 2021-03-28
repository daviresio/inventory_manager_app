import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/services/remote_files_service.dart';

final productFormProvider =
    StateNotifierProvider<ProductForm>((ref) => ProductForm());

class ProductForm extends StateNotifier<ProductModel> {
  ProductForm([ProductModel? product])
      : super(product ?? ProductModel(name: '', amount: 0));

  void setImage(String imagePath) async {
    state = state.copyWith(image: null);

    var result =
        await RemoteFilesService.saveProductImage(imagePath: imagePath);
    if (result != null) {
      state = state.copyWith(image: result);
    }
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
