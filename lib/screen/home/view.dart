import 'package:flutter/material.dart';
import 'package:my_test_project/screen/cart/cart_view.dart';
import 'package:provider/provider.dart';

import '../../model/cart_model.dart';
import '../../provider/cart_provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Shopping"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => CartView()));
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.65,
                crossAxisSpacing: 17.0,
                mainAxisSpacing: 17,
              ),
              itemCount: FetchProduct.productList.length,
              itemBuilder: (BuildContext ctx, index) {
                final items = FetchProduct.productList[index];

                return Container(
                  child: Column(
                    children: [
                      Image.network(
                        '${items.imgUrl}',
                        height: 140,
                      ),
                      Text("${items.title}"),
                      MaterialButton(
                        color: Colors.amber,
                        onPressed: () {
                          CartModel cartModel = CartModel(
                              id: items.id,
                              title: items.title,
                              price: double.parse(items.price.toString()),
                              totalPrice: double.parse(items.price.toString()),
                              qty: cart.qty,
                              imgUrl: items.imgUrl);
                          cart.addProductToCart(context, product: cartModel);
                        },
                        child: Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
