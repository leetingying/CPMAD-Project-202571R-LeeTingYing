import 'package:flutter/material.dart';
import 'package:lee_ting_ying_project/model/Menu.dart';
import 'package:lee_ting_ying_project/model/Restaurant.dart';
import 'package:lee_ting_ying_project/screens/CartPage.dart';
import 'package:lee_ting_ying_project/services/firestore_service.dart';
import 'package:get/get.dart';
import 'package:lee_ting_ying_project/services/CartController.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  final String mName;
  final String mpic;
  final String mPrice;
  bool checkquantitySelected = false;
  DetailsPage(
      {Key key, @required this.index, this.mName, this.mpic, this.mPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // var cartController = Get.find<CartController>();
    var cartController = Get.put(CartController());
    var cart = cartController.cart;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('Details'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                      tag: '$mpic',
                      child: Image(
                        height: 280,
                        width: 300,
                        image: AssetImage(mpic),
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$mName',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text('Price: ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$mPrice',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
              ],
            ),
            Row(children: [
              const Spacer(),
              Text('Quantity: ',
                  style:
                      TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                  checkquantitySelected = true;
                  cartController.addToCart(index, checkquantitySelected);
                  checkquantitySelected = false;
                },
              ),
              Text(
                  '${cartController.cart[index] == null ? 0 : cartController.cart[index]}'),
              IconButton(
                icon: Icon(Icons.remove),
                color: Colors.black,
                onPressed: () {
                  cartController.removeToCart(index);
                },
              ),
              const Spacer(),
            ]),
            Row(children: [
              const Spacer(),
              RaisedButton(
                color: Colors.brown,
                onPressed: cartController.cart[index] != null &&
                        cartController.cart[index] != 0
                    ? () {
                        Get.to(()=>CartPage(
                            index: index,
                            mName: mName,
                            mpic: mpic,
                            mPrice: mPrice));
                      }
                    : null,
                child: Text("Go to Cart"),
              ),
              const Spacer(),
            ])
          ],
        ));
  }
}
