import 'dart:convert';
/// status : 1
/// message : "Favorite adds Successfully"
/// data : [{"favorite_id":"13","user_id":"4","product_asin":"B0858XBSN3","product_description":"Hemp Jelly Beans 150 Cts","offer_expiration":"0000-00-00","discount":"0.00","regular_price":"23.99","discount_price":"0.00","added_on":"2023-10-20 00:00:00","product_image_url":"https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg"},{"favorite_id":"14","user_id":"4","product_asin":"B071K23Z8Y","product_description":"Raw Organic Moringa Powder - Pure Leaves from The Moringa Oleifera Tree in India - Nutrient-Rich Superfood for Tea, Smoothies & Vegetable Protein - Gluten-Free, Keto, Vegan, & Non-GMO - 1lb/ 16oz","offer_expiration":"0000-00-00","discount":"0.00","regular_price":"14.99","discount_price":"0.00","added_on":"2023-10-20 00:00:00","product_image_url":"https://images-na.ssl-images-amazon.com/images/I/41lvkV1Oc-L.jpg"}]

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));
String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());
class FavoriteModel {
  FavoriteModel({
      num? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FavoriteModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Data>? _data;
FavoriteModel copyWith({  num? status,
  String? message,
  List<Data>? data,
}) => FavoriteModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// favorite_id : "13"
/// user_id : "4"
/// product_asin : "B0858XBSN3"
/// product_description : "Hemp Jelly Beans 150 Cts"
/// offer_expiration : "0000-00-00"
/// discount : "0.00"
/// regular_price : "23.99"
/// discount_price : "0.00"
/// added_on : "2023-10-20 00:00:00"
/// product_image_url : "https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? favoriteId, 
      String? userId, 
      String? productAsin, 
      String? productDescription, 
      String? offerExpiration, 
      String? discount, 
      String? regularPrice, 
      String? discountPrice, 
      String? addedOn, 
      String? productImageUrl,}){
    _favoriteId = favoriteId;
    _userId = userId;
    _productAsin = productAsin;
    _productDescription = productDescription;
    _offerExpiration = offerExpiration;
    _discount = discount;
    _regularPrice = regularPrice;
    _discountPrice = discountPrice;
    _addedOn = addedOn;
    _productImageUrl = productImageUrl;
}

  Data.fromJson(dynamic json) {
    _favoriteId = json['favorite_id'];
    _userId = json['user_id'];
    _productAsin = json['product_asin'];
    _productDescription = json['product_description'];
    _offerExpiration = json['offer_expiration'];
    _discount = json['discount'];
    _regularPrice = json['regular_price'];
    _discountPrice = json['discount_price'];
    _addedOn = json['added_on'];
    _productImageUrl = json['product_image_url'];
  }
  String? _favoriteId;
  String? _userId;
  String? _productAsin;
  String? _productDescription;
  String? _offerExpiration;
  String? _discount;
  String? _regularPrice;
  String? _discountPrice;
  String? _addedOn;
  String? _productImageUrl;
Data copyWith({  String? favoriteId,
  String? userId,
  String? productAsin,
  String? productDescription,
  String? offerExpiration,
  String? discount,
  String? regularPrice,
  String? discountPrice,
  String? addedOn,
  String? productImageUrl,
}) => Data(  favoriteId: favoriteId ?? _favoriteId,
  userId: userId ?? _userId,
  productAsin: productAsin ?? _productAsin,
  productDescription: productDescription ?? _productDescription,
  offerExpiration: offerExpiration ?? _offerExpiration,
  discount: discount ?? _discount,
  regularPrice: regularPrice ?? _regularPrice,
  discountPrice: discountPrice ?? _discountPrice,
  addedOn: addedOn ?? _addedOn,
  productImageUrl: productImageUrl ?? _productImageUrl,
);
  String? get favoriteId => _favoriteId;
  String? get userId => _userId;
  String? get productAsin => _productAsin;
  String? get productDescription => _productDescription;
  String? get offerExpiration => _offerExpiration;
  String? get discount => _discount;
  String? get regularPrice => _regularPrice;
  String? get discountPrice => _discountPrice;
  String? get addedOn => _addedOn;
  String? get productImageUrl => _productImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['favorite_id'] = _favoriteId;
    map['user_id'] = _userId;
    map['product_asin'] = _productAsin;
    map['product_description'] = _productDescription;
    map['offer_expiration'] = _offerExpiration;
    map['discount'] = _discount;
    map['regular_price'] = _regularPrice;
    map['discount_price'] = _discountPrice;
    map['added_on'] = _addedOn;
    map['product_image_url'] = _productImageUrl;
    return map;
  }

}