import 'package:get/get.dart';
import 'package:reservation_app/model/model.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;
  var countProducts = 0.obs; // استخدام RxInt بدلاً من int

  void addToCart(Products item) {
    cartItems.add(item);
    countProducts.value = cartItems.length;
  }

  void removeFromCart(Products item) {
    cartItems.remove(item);
    countProducts.value = cartItems.length;
  }
}
