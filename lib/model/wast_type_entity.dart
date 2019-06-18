class Wast {
  String cats;
  String fl;
  String name;
  String alias;
  String id;

  Wast({this.cats, this.fl, this.name, this.alias, this.id});

  Wast.fromJson(Map<String, dynamic> json) {
    cats = json['cats'];
    fl = json['fl'];
    name = json['name'];
    alias = json['alias'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cats'] = this.cats;
    data['fl'] = this.fl;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['id'] = this.id;
    return data;
  }
}

class WastResult {
  String name;
}
