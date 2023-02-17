import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lee_ting_ying_project/model/Menu.dart';
import 'package:lee_ting_ying_project/screens/OrderPage.dart';
import 'package:lee_ting_ying_project/services/CartController.dart';
import 'package:lee_ting_ying_project/services/firestore_service.dart';


class CartPage extends StatelessWidget {
  final int index;
  final String mName;
  final String mpic;
  final String mPrice;
  CartPage({Key key, @required this.index, this.mName, this.mpic, this.mPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Find injected GetXController Instance
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          title: Text("Your Cart"),
          actions: [
            Column(children: [
              Center(
                child: Obx(
                  () => Text(
                    'Total: ' + cartController.cartCount.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ]),
          ],
        ),
        body: Obx(() => ListView.builder(
            itemCount: cartController.cartCount,
            itemBuilder: (context, index) {
              int cartIndex = cart.keys.toList()[index];
              int count = cart[cartIndex];

              return Column(children: [
                Card(
                  color: Colors.lightBlueAccent[50],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 50, 8),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('$mpic'),
                                // fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Name: $mName',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                        
                            Text('Quantity: $count',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            cartController.clear(cartIndex);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Colors.brown,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderPage()));
                  },
                  child: Text("Check out"),
                ),
              ]);
            })));
  }
}
