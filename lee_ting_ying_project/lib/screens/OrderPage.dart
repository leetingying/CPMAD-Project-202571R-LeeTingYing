import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Order Placed'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Your Order have been placed.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ]),
          Text('Order number: 9257',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          Text('Kindly wait for 25 minutes',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
