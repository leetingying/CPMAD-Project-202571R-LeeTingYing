import 'package:flutter/material.dart';
import 'package:lee_ting_ying_project/screens/AboutPage.dart';
import 'package:lee_ting_ying_project/screens/ProfilePage.dart';
import 'package:lee_ting_ying_project/services/firebaseauth_service.dart';
import 'package:lee_ting_ying_project/screens/showRestaurant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Makan Delivery"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            iconSize: 60,
            tooltip: 'view restaurants',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RestaurantPage()));
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to Makan Delivery',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 50.0,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Click on the button below for',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                  RaisedButton(
                      color: Colors.brown,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()));
                      },
                      child: Text('About Us')),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Click on the button below for',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                  RaisedButton(
                      color: Colors.brown,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Text('Profile')),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Click on the top right hand button to start',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.brown,
        tooltip: 'Sign Out',
        onPressed: () async {
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}
