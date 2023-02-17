import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
        title: Text('Profile'),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       Text('What is Makan Delivery?',
      //           style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      //     ]),
      //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       Text(
      //           'Makan Delivery is an application that allows users to place food orders online as well as explore the various restaurants available',
      //           style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
      //     ]),
      //   ],
      // ),
    );
  }
}
