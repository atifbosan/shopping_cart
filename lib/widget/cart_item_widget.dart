import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String productImgUrl;
  final String productTitle;
  final String productPrice;
  final String productQty;
  final VoidCallback onIcreament;
  final VoidCallback onDecreament;
  final VoidCallback onRemove;
  const CartItemWidget(
      {Key? key,
      required this.productImgUrl,
      required this.productTitle,
      required this.productPrice,
      required this.onIcreament,
      required this.onDecreament,
      required this.onRemove,
      required this.productQty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.grey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            '$productImgUrl',
            height: 100,
            width: 100,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$productTitle',
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$",
                        ),
                        Text(
                          "$productPrice",
                        ),
                        Text(
                          ".99",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onDecreament,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      size: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "$productQty",
                ),
              ),
              GestureDetector(
                onTap: onIcreament,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: onRemove,
                child: Icon(
                  CupertinoIcons.delete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
