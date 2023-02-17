class Menu {
  String uid;
  String rid;
  String name;
  String pic;
  String desc;
  String price;

  Menu({this.uid, this.rid, this.name, this.pic, this.desc, this.price});
  Menu.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    rid = data['rid'];
    name = data['name'];
    pic = data['pic'];
    desc = data['desc'];
    price = data['price'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'rid': rid,
      'name': name,
      'pic': pic,
      'desc': desc,
      'price': price
    };
  }
}
