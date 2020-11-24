class User {
  int _id;
  String _name;
  String _sorubir;
  String _soruiki;
  String _soruuc;
  String _tarih;


  int get id => _id;
  String get name => _name;
  String get sorubir => _sorubir;
  String get soruiki => _soruiki;
  String get soruuc => _soruuc;
  String get tarih => _tarih;
  set id(int value) {
    _id = value;
  }
  set name(String value) {
    _name = value;
  }
  set sorubir(String value) {
    _sorubir = value;
  }
  set soruiki(String value) {
    _soruiki = value;
  }
  set soruuc(String value) {
    _soruuc = value;
  }
  set tarih(String value) {
    _tarih = value;
  }





  User(this._name,this._sorubir,this._soruiki,this._soruuc,this._tarih);

  User.withId(this._id, this._name,this._sorubir,this._soruiki,this._soruuc,this._tarih);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = _id;
    map['name'] = _name;
    map['sorubir'] = _sorubir;
    map['soruiki'] = _soruiki;
    map['soruuc'] = _soruuc;
    map['tarih'] = _tarih;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._sorubir = map['sorubir'];
    this._soruiki = map['soruiki'];
    this._soruuc = map['soruuc'];
    this._tarih = map['tarih'];
  }

  @override
  String toString() {
    return 'User{_id: $_id, _name: $_name,}';
  }
}
