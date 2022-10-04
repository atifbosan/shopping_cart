import 'package:flutter/cupertino.dart';
import 'package:my_test_project/helper/scaf_messenger.dart';

import '../model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cart = [];
  double totalCartValue = 0.0;
  int get total => cart.length;
  int qty = 1;

  increment() {
    qty++;
    notifyListeners();
  }

  decrement() {
    if (qty > 1) {
      qty--;
    }
    notifyListeners();
  }

  // add product to cart

  void addProductToCart(BuildContext context, {required product}) {
    try {
      int index = cart.indexWhere((element) => element.id == product.id);

      if (_isItemAlreadyAdded(product)) {
        SMHelper.msgFail(context, "Product is already exists");
      } else {
        if (index != -1) {
          updateProduct(product, product.qty + 1);
        } else {
          cart.add(product);
          calculateTotal();
        }
      }
      notifyListeners();
    } catch (e) {
      SMHelper.msgFail(context, "Cannot add this item");
    }
    notifyListeners();
  }

  //remove product
  void removeProduct(id) {
    int index = cart.indexWhere((i) => i.id == id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == id);
    calculateTotal();
    notifyListeners();
  }

  //update product quantity

  void updateProduct(
    product,
    qty,
  ) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    cart[index].totalPrice = double.parse(cart[index].price.toString()) *
        int.parse(cart[index].qty.toString());
// quantity of item less than 1 then remove the item
    /*   if (cart[index].qty == 0)
       removeProduct(
          product.id);
*/
    calculateTotal();
    notifyListeners();
  }

  //cal calculate data every time if there is an any data add or remove
  void calculateTotal() {
    totalCartValue = 0.0;
    cart.forEach((f) {
      totalCartValue += (f.price! * f.qty!);
      notifyListeners();
    });
  }

  //check if product is already in the cart
  bool _isItemAlreadyAdded(product) =>
      cart.where((item) => item.id == product.id).isNotEmpty;
  //clear full cart if there is an any data in the file
  void clearCart() {
    cart.forEach((f) =>
        f.qty = 1); //check the cart if there is an any item then clear the cart
    cart = [];
    notifyListeners();
  }
}
