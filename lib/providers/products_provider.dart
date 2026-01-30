import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  int productsCount = 0;
  double totalPrice = 0;
  List<ProductModel> selectedProducts = [];

  void addProduct(ProductModel product) {
    if (selectedProducts.contains(product)) {
      increaseQuantity(product);
    } else {
      selectedProducts.add(product);
      productsCount++;
      totalPrice += product.price;
      notifyListeners();
    }
  }

  void removeProduct(ProductModel product) {
    selectedProducts.remove(product);
    productsCount -= product.amount;
    totalPrice -= product.price * product.amount;
    product.amount = 0;
    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    product.amount++;
    productsCount++;
    totalPrice += product.price;
    notifyListeners();
  }

  void decreaseQuantity(ProductModel product) {
    if (product.amount == 1) {
      removeProduct(product);
    } else {
      product.amount--;
      productsCount--;
      totalPrice -= product.price;
      notifyListeners();
    }
  }
}
