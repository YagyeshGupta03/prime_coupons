import 'dart:convert';
/// status : 1
/// message : "Get All Category Data Successfully"
/// data : [{"id":"1","english_text":"Grocery & Gourmet Food","spanish_text":"Alimentos y Comida Gourmet","icons":"/assets/images/mobile/grocery.png","created_at":"2023-05-25 05:11:43"},{"id":"2","english_text":"Arts, Crafts & Sewing","spanish_text":"Artes, Manualidades y Costura","icons":"/assets/images/mobile/art-crafts.png","created_at":"2023-05-25 05:11:43"},{"id":"3","english_text":"Office & School Supplies","spanish_text":"Articulos Escolares y de Oficina","icons":"/assets/images/mobile/office-school.png","created_at":"2023-05-25 05:12:12"},{"id":"4","english_text":"Pet Food & Supplies","spanish_text":"Articulos y Alimento para Mascotas","icons":"/assets/images/mobile/pets.png","created_at":"2023-05-25 05:12:12"},{"id":"5","english_text":"Automotive","spanish_text":"Automotriz","icons":"/assets/images/mobile/automotive.png","created_at":"2023-05-25 05:12:40"},{"id":"6","english_text":"Baby & Nursery","spanish_text":"Bebe y Dormitorio del Bebe","icons":"/assets/images/mobile/baby.png","created_at":"2023-05-25 05:12:40"},{"id":"7","english_text":"Beauty & Grooming","spanish_text":"Belleza y Grooming","icons":"/assets/images/mobile/beauty-grooming.png","created_at":"2023-05-25 05:13:06"},{"id":"8","english_text":"Cell Phones & Accessories","spanish_text":"Celulares y Accesorios","icons":"/assets/images/mobile/cell-phone.png","created_at":"2023-05-25 05:13:06"},{"id":"9","english_text":"Kitchen & Dining","spanish_text":"Cocina y Comedor","icons":"/assets/images/mobile/kitchen.png","created_at":"2023-05-25 05:13:31"},{"id":"10","english_text":"Electronic Components & Home Audio","spanish_text":"Componentes Electronicos y Audio en Casa","icons":"/assets/images/mobile/electronics.png","created_at":"2023-05-25 05:13:31"},{"id":"11","english_text":"Computers, Tablets & Components","spanish_text":"Computadoras, Tablets y Componentes","icons":"/assets/images/mobile/computers.png","created_at":"2023-05-25 05:13:57"},{"id":"12","english_text":"Sports & Fitness","spanish_text":"Deportes y Fitness","icons":"/assets/images/mobile/sports.png","created_at":"2023-05-25 05:13:57"},{"id":"13","english_text":"Major Appliances","spanish_text":"Electrodomesticos Grandes","icons":"/assets/images/mobile/major-appliances.png","created_at":"2023-05-25 05:14:21"},{"id":"14","english_text":"Musical Instruments","spanish_text":"Instrumentos Musicales","icons":"/assets/images/mobile/musical.png","created_at":"2023-05-25 05:14:21"},{"id":"15","english_text":"Jewelry","spanish_text":"Joyeria","icons":"/assets/images/mobile/jewelry.png","created_at":"2023-05-25 05:14:46"},{"id":"16","english_text":"Toys & Games","spanish_text":"Juguetes y Juegos","icons":"/assets/images/mobile/toys.png","created_at":"2023-05-25 05:14:46"},{"id":"17","english_text":"Home Improvement","spanish_text":"Mejoras del Hogar","icons":"/assets/images/mobile/home-improvement.png","created_at":"2023-05-25 05:15:12"},{"id":"18","english_text":"Miscellaneous","spanish_text":"Miscelaneo","icons":"/assets/images/mobile/misc.png","created_at":"2023-05-25 05:15:12"},{"id":"19","english_text":"Patio, Lawn & Garden","spanish_text":"Patio, Cesped y Jardin","icons":"/assets/images/mobile/patio-lawn.png","created_at":"2023-05-25 05:15:37"},{"id":"20","english_text":"Watches","spanish_text":"Relojes","icons":"/assets/images/mobile/watches.png","created_at":"2023-05-25 05:15:37"},{"id":"21","english_text":"Clothing & Accessories","spanish_text":"Ropa y Accesorios","icons":"/assets/images/mobile/clothing.png","created_at":"2023-05-25 05:16:01"},{"id":"22","english_text":"Adults, Health & Household","spanish_text":"Salud y Hogar","icons":"/assets/images/mobile/adults-health.png","created_at":"2023-05-25 05:16:01"},{"id":"23","english_text":"Video Games","spanish_text":"Videojuegos","icons":"/assets/images/mobile/videogames.png","created_at":"2023-05-25 05:16:26"},{"id":"24","english_text":"Shoes, Handbags, Wallets, Sunglasses","spanish_text":"Zapatos, Bolsos de Mano, Billeteras, Lentes de Sol","icons":"/assets/images/mobile/shoes-bags.png","created_at":"2023-05-25 05:16:26"}]
/// base_url : "https://server24.in/clipeate/"

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      num? status, 
      String? message, 
      List<Data>? data, 
      String? baseUrl,}){
    _status = status;
    _message = message;
    _data = data;
    _baseUrl = baseUrl;
}

  CategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _baseUrl = json['base_url'];
  }
  num? _status;
  String? _message;
  List<Data>? _data;
  String? _baseUrl;
CategoryModel copyWith({  num? status,
  String? message,
  List<Data>? data,
  String? baseUrl,
}) => CategoryModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  baseUrl: baseUrl ?? _baseUrl,
);
  num? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  String? get baseUrl => _baseUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['base_url'] = _baseUrl;
    return map;
  }

}

/// id : "1"
/// english_text : "Grocery & Gourmet Food"
/// spanish_text : "Alimentos y Comida Gourmet"
/// icons : "/assets/images/mobile/grocery.png"
/// created_at : "2023-05-25 05:11:43"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? englishText, 
      String? spanishText, 
      String? icons, 
      String? createdAt,}){
    _id = id;
    _englishText = englishText;
    _spanishText = spanishText;
    _icons = icons;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _englishText = json['english_text'];
    _spanishText = json['spanish_text'];
    _icons = json['icons'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _englishText;
  String? _spanishText;
  String? _icons;
  String? _createdAt;
Data copyWith({  String? id,
  String? englishText,
  String? spanishText,
  String? icons,
  String? createdAt,
}) => Data(  id: id ?? _id,
  englishText: englishText ?? _englishText,
  spanishText: spanishText ?? _spanishText,
  icons: icons ?? _icons,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get englishText => _englishText;
  String? get spanishText => _spanishText;
  String? get icons => _icons;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['english_text'] = _englishText;
    map['spanish_text'] = _spanishText;
    map['icons'] = _icons;
    map['created_at'] = _createdAt;
    return map;
  }

}