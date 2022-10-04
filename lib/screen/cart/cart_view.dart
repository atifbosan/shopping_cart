import 'package:flutter/material.dart';
import 'package:my_test_project/widget/cart_item_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartPr = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                child: ListView.builder(
                    itemCount: cartPr.cart.length + 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (index == cartPr.cart.length) {
                        return Container(
                          height: 140,
                        );
                      }
                      final items = cartPr.cart[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartItemWidget(
                          productImgUrl: '${items.imgUrl}',
                          productTitle: '${items.title}',
                          productPrice:
                              "${double.parse(items.totalPrice.toString())}", //int.parse(cartPr.cart[index].qty.toString())
                          onIcreament: () {
                            cartPr.updateProduct(
                              items,
                              int.parse(items.qty.toString()) + 1,
                            );
                          },
                          onDecreament: () {
                            if (int.parse(items.qty.toString()) > 1) {
                              cartPr.updateProduct(
                                  items, int.parse(items.qty.toString()) - 1);
                            }
                          },
                          onRemove: () {
                            cartPr.removeProduct(items.id);
                          },
                          productQty: '${items.qty.toString()}',
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 70,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.zero,
                          ),
                          elevation: 0,
                          onPressed: () {},
                          child: Text(
                            "Checkout",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
