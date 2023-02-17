import 'package:flutter/material.dart';
import 'package:lee_ting_ying_project/model/Menu.dart';
import 'package:lee_ting_ying_project/screens/DetailsPage.dart';
import 'package:lee_ting_ying_project/services/firestore_service.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  int index;
  String rName;
  String rpic;
  MenuPage({this.index, this.rName, this.rpic});
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Menu'),
      ),
      body: FutureBuilder<List<Menu>>(
        future: FirestoreService().readMenuData(),
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
                      child: _buildGridCards(
                          index,
                          'images/' + snapshot.data[index].pic,
                          snapshot.data[index].name,
                          '\$'+snapshot.data[index].price),
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

Widget _buildGridCards(
    int index, String imgPath, String menuName, String menuPrice) {
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
        Column(
          children: [
            Text(
              menuName,
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
            Text(
              '\$' + menuPrice.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 14.0),
            ),
          ],
        ),
        const Spacer(),
        Expanded(
            child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  Get.to(() =>DetailsPage(
                      index: index,
                      mName: menuName,
                      mpic: imgPath,
                      mPrice: menuPrice));
                }))
      ],
    ),
  );
}
