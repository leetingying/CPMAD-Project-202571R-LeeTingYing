import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lee_ting_ying_project/model/Restaurant.dart';
import 'package:lee_ting_ying_project/model/Menu.dart';

class FirestoreService {
  // Create a CollectionReference called RestaurantCollection that references
  // the firestore collection
  final CollectionReference RestaurantCollection =
      FirebaseFirestore.instance.collection('Restaurant');
  final CollectionReference MenuCollection =
      FirebaseFirestore.instance.collection('Menu');

  Future<void> addRestaurantData(
      String restaurantname, String restaurantpic) async {
    var docRef = FirestoreService().RestaurantCollection.doc();
    print('add docRef: ' + docRef.id);
    await RestaurantCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': restaurantname,
      'pic': restaurantpic,
    });
  }

  Future<List<Restaurant>> readRestaurantData() async {
    List<Restaurant> restaurantList = [];
    QuerySnapshot snapshot = await RestaurantCollection.get();
    snapshot.docs.forEach((document) {
      Restaurant restaurant = Restaurant.fromMap(document.data());
      restaurantList.add(restaurant);
    });
    print('restaurantlist: $restaurantList');
    return restaurantList;
  }

  //for your reference
  Future<void> updateRestaurantData(
      String restaurantname, String restaurantpic) async {
    var docRef = FirestoreService().RestaurantCollection.doc();
    print('update docRef: ' + docRef.id);
    await RestaurantCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': restaurantname,
      'pic': restaurantpic,
    });
  }

  Future<List<Menu>> readMenuData() async {
    List<Menu> menuList = [];
    QuerySnapshot snapshot = await MenuCollection.get();
    snapshot.docs.forEach((document) async {
      Menu menu = Menu.fromMap(document.data());
      menuList.add(menu);
    });
    print('menulist: $menuList');
    return menuList;
  }
}
