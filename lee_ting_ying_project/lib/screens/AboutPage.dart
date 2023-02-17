import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('About us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('What is Makan Delivery?',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 50,
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 300,
                child: Text(
                    'Makan Delivery is an application that allows users to place food orders online as well as explore the various restaurants available',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
