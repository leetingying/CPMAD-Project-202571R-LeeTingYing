class Restaurant {
  String uid;
  String name;
  String pic;

  Restaurant({this.uid, this.name, this.pic});
  Restaurant.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    pic = data['pic'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'pic': pic,
    };
  }
}
