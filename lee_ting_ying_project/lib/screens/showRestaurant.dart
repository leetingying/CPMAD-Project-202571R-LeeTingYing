import 'package:flutter/material.dart';
import 'package:lee_ting_ying_project/model/Restaurant.dart';
import 'package:lee_ting_ying_project/services/firestore_service.dart';
import 'package:lee_ting_ying_project/screens/showMenu.dart';
import 'package:get/get.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Restaurant'),
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: FirestoreService().readRestaurantData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(75.0))),
                    child: InkWell(
                      splashColor: Colors.blueAccent,
                      highlightColor: Colors.blueAccent.withOpacity(1.0),
                      // onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => MenuPage()));
                      // },
                      child: _buildGridCards(
                          index,
                          'images/' + snapshot.data[index].pic,
                          snapshot.data[index].name),
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget _buildGridCards(int index, String imgPath, String restaurantName) {
  return Card(
    elevation: 5,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Text(
          restaurantName,
          style: TextStyle(color: Colors.blue, fontSize: 16.0),
        ),
        const Spacer(),
        Expanded(
            child: RaisedButton(
                color: Colors.brown[300],
                child: (Text('View Menu')),
                onPressed: () {
                  Get.to(()=>MenuPage(
                      index: index, rName: restaurantName, rpic: imgPath));
                }))
      ],
    ),
  );
}
