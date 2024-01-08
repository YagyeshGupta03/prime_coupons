import 'dart:convert';
/// status : 1
/// message : "get all data successful"
/// data : [{"Discount":"$6.0","Promo_Code":"B0858XBSN3","coupon_ready_for_use":"1","Category":"Alimentos y Comida Gourmet","Category_English":"Grocery & Gourmet Food","Promo_Start_Date":null,"Promo_Start_Time":null,"Html_Link":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20","Valid_Date":null,"Standard_Link":null,"Standard_Link_Spanish":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20&language=es_US","Standard_Link_English":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20","Short_Link":null,"Promo_description":null,"English_Short_Product_Description":"Hemp Jelly Beans 150 Cts","English_Prod_Description_Full":"<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>","english_modified_to_html":"1","Reviews":"568","Dollar":null,"Cents":null,"Regular_Price":"23.99","Final_Price":"17.99","Total_Savings":"6","is_price_updated":"1","Stock":null,"Image_URL":"https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg","Image_Full_Res":null,"Image_Full_Res_2":"https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg","Image_Full_Res_3":"","Image_Full_Res_4":"","Image_Full_Res_5":"","Price_Drop_Date":"2023-10-18","Price_Drop_Time":"12:34","ASIN":"B0858XBSN3","Price_History":null,"Price_History_Local":"https://clipeate.com/price_history/B0858XBSN3.png","Price_History_Downloaded":null,"Spanish_Text":"Hemp Jelly Beans 150 Cts translates to Spanish as: Jelly Beans de cáñamo 150 unidades.","Spanish_Text_Translated":"1","Spanish_Prod_Description_Full":"<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>","spanish_modified_to_html":"1","stars":"4.0","Superclip_Status":null,"Superclip_extra_discount":null,"Valid_Date_Modified":"2023-10-20","FB_sent":"1","id":"1582","Prime_Exclusive_Price":"0"},{"Discount":"$6.0","Promo_Code":"B0858XBSN3","coupon_ready_for_use":"1","Category":"Alimentos y Comida Gourmet","Category_English":"Grocery & Gourmet Food","Promo_Start_Date":null,"Promo_Start_Time":null,"Html_Link":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20","Valid_Date":null,"Standard_Link":null,"Standard_Link_Spanish":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20&language=es_US","Standard_Link_English":"https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20","Short_Link":null,"Promo_description":null,"English_Short_Product_Description":"Hemp Jelly Beans 150 Cts","English_Prod_Description_Full":"<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>","english_modified_to_html":"1","Reviews":"568","Dollar":null,"Cents":null,"Regular_Price":"23.99","Final_Price":"17.99","Total_Savings":"6","is_price_updated":"1","Stock":null,"Image_URL":"https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg","Image_Full_Res":null,"Image_Full_Res_2":"https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg","Image_Full_Res_3":"","Image_Full_Res_4":"","Image_Full_Res_5":"","Price_Drop_Date":"2023-10-18","Price_Drop_Time":"12:34","ASIN":"B0858XBSN3","Price_History":null,"Price_History_Local":"https://clipeate.com/price_history/B0858XBSN3.png","Price_History_Downloaded":null,"Spanish_Text":"Hemp Jelly Beans 150 Cts translates to Spanish as: Jelly Beans de cáñamo 150 unidades.","Spanish_Text_Translated":"1","Spanish_Prod_Description_Full":"<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>","spanish_modified_to_html":"1","stars":"4.0","Superclip_Status":null,"Superclip_extra_discount":null,"Valid_Date_Modified":"2023-10-20","FB_sent":"1","id":"1582","Prime_Exclusive_Price":"0"}]

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      num? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ProductModel.fromJson(dynamic json) {
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
ProductModel copyWith({  num? status,
  String? message,
  List<Data>? data,
}) => ProductModel(  status: status ?? _status,
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

/// Discount : "$6.0"
/// Promo_Code : "B0858XBSN3"
/// coupon_ready_for_use : "1"
/// Category : "Alimentos y Comida Gourmet"
/// Category_English : "Grocery & Gourmet Food"
/// Promo_Start_Date : null
/// Promo_Start_Time : null
/// Html_Link : "https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20"
/// Valid_Date : null
/// Standard_Link : null
/// Standard_Link_Spanish : "https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20&language=es_US"
/// Standard_Link_English : "https://www.amazon.com/dp/B0858XBSN3?tag=fncpr0d-20"
/// Short_Link : null
/// Promo_description : null
/// English_Short_Product_Description : "Hemp Jelly Beans 150 Cts"
/// English_Prod_Description_Full : "<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>"
/// english_modified_to_html : "1"
/// Reviews : "568"
/// Dollar : null
/// Cents : null
/// Regular_Price : "23.99"
/// Final_Price : "17.99"
/// Total_Savings : "6"
/// is_price_updated : "1"
/// Stock : null
/// Image_URL : "https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg"
/// Image_Full_Res : null
/// Image_Full_Res_2 : "https://images-na.ssl-images-amazon.com/images/I/51pO9hwkxsL.jpg"
/// Image_Full_Res_3 : ""
/// Image_Full_Res_4 : ""
/// Image_Full_Res_5 : ""
/// Price_Drop_Date : "2023-10-18"
/// Price_Drop_Time : "12:34"
/// ASIN : "B0858XBSN3"
/// Price_History : null
/// Price_History_Local : "https://clipeate.com/price_history/B0858XBSN3.png"
/// Price_History_Downloaded : null
/// Spanish_Text : "Hemp Jelly Beans 150 Cts translates to Spanish as: Jelly Beans de cáñamo 150 unidades."
/// Spanish_Text_Translated : "1"
/// Spanish_Prod_Description_Full : "<h1 class=\"a-size-base-plus a-text-bold\"> About this item </h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\"></ul>"
/// spanish_modified_to_html : "1"
/// stars : "4.0"
/// Superclip_Status : null
/// Superclip_extra_discount : null
/// Valid_Date_Modified : "2023-10-20"
/// FB_sent : "1"
/// id : "1582"
/// Prime_Exclusive_Price : "0"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? discount, 
      String? promoCode, 
      String? couponReadyForUse, 
      String? category, 
      String? categoryEnglish, 
      dynamic promoStartDate, 
      dynamic promoStartTime, 
      String? htmlLink, 
      dynamic validDate, 
      dynamic standardLink, 
      String? standardLinkSpanish, 
      String? standardLinkEnglish, 
      dynamic shortLink, 
      dynamic promoDescription, 
      String? englishShortProductDescription, 
      String? englishProdDescriptionFull, 
      String? englishModifiedToHtml, 
      String? reviews, 
      dynamic dollar, 
      dynamic cents, 
      String? regularPrice, 
      String? finalPrice, 
      String? totalSavings, 
      String? isPriceUpdated, 
      dynamic stock, 
      String? imageURL, 
      dynamic imageFullRes, 
      String? imageFullRes2, 
      String? imageFullRes3, 
      String? imageFullRes4, 
      String? imageFullRes5, 
      String? priceDropDate, 
      String? priceDropTime, 
      String? asin, 
      dynamic priceHistory, 
      String? priceHistoryLocal, 
      dynamic priceHistoryDownloaded, 
      String? spanishText, 
      String? spanishTextTranslated, 
      String? spanishProdDescriptionFull, 
      String? spanishModifiedToHtml, 
      String? stars, 
      dynamic superclipStatus, 
      dynamic superclipExtraDiscount, 
      String? validDateModified, 
      String? fBSent, 
      String? id, 
      String? primeExclusivePrice,}){
    _discount = discount;
    _promoCode = promoCode;
    _couponReadyForUse = couponReadyForUse;
    _category = category;
    _categoryEnglish = categoryEnglish;
    _promoStartDate = promoStartDate;
    _promoStartTime = promoStartTime;
    _htmlLink = htmlLink;
    _validDate = validDate;
    _standardLink = standardLink;
    _standardLinkSpanish = standardLinkSpanish;
    _standardLinkEnglish = standardLinkEnglish;
    _shortLink = shortLink;
    _promoDescription = promoDescription;
    _englishShortProductDescription = englishShortProductDescription;
    _englishProdDescriptionFull = englishProdDescriptionFull;
    _englishModifiedToHtml = englishModifiedToHtml;
    _reviews = reviews;
    _dollar = dollar;
    _cents = cents;
    _regularPrice = regularPrice;
    _finalPrice = finalPrice;
    _totalSavings = totalSavings;
    _isPriceUpdated = isPriceUpdated;
    _stock = stock;
    _imageURL = imageURL;
    _imageFullRes = imageFullRes;
    _imageFullRes2 = imageFullRes2;
    _imageFullRes3 = imageFullRes3;
    _imageFullRes4 = imageFullRes4;
    _imageFullRes5 = imageFullRes5;
    _priceDropDate = priceDropDate;
    _priceDropTime = priceDropTime;
    _asin = asin;
    _priceHistory = priceHistory;
    _priceHistoryLocal = priceHistoryLocal;
    _priceHistoryDownloaded = priceHistoryDownloaded;
    _spanishText = spanishText;
    _spanishTextTranslated = spanishTextTranslated;
    _spanishProdDescriptionFull = spanishProdDescriptionFull;
    _spanishModifiedToHtml = spanishModifiedToHtml;
    _stars = stars;
    _superclipStatus = superclipStatus;
    _superclipExtraDiscount = superclipExtraDiscount;
    _validDateModified = validDateModified;
    _fBSent = fBSent;
    _id = id;
    _primeExclusivePrice = primeExclusivePrice;
}

  Data.fromJson(dynamic json) {
    _discount = json['Discount'];
    _promoCode = json['Promo_Code'];
    _couponReadyForUse = json['coupon_ready_for_use'];
    _category = json['Category'];
    _categoryEnglish = json['Category_English'];
    _promoStartDate = json['Promo_Start_Date'];
    _promoStartTime = json['Promo_Start_Time'];
    _htmlLink = json['Html_Link'];
    _validDate = json['Valid_Date'];
    _standardLink = json['Standard_Link'];
    _standardLinkSpanish = json['Standard_Link_Spanish'];
    _standardLinkEnglish = json['Standard_Link_English'];
    _shortLink = json['Short_Link'];
    _promoDescription = json['Promo_description'];
    _englishShortProductDescription = json['English_Short_Product_Description'];
    _englishProdDescriptionFull = json['English_Prod_Description_Full'];
    _englishModifiedToHtml = json['english_modified_to_html'];
    _reviews = json['Reviews'];
    _dollar = json['Dollar'];
    _cents = json['Cents'];
    _regularPrice = json['Regular_Price'];
    _finalPrice = json['Final_Price'];
    _totalSavings = json['Total_Savings'];
    _isPriceUpdated = json['is_price_updated'];
    _stock = json['Stock'];
    _imageURL = json['Image_URL'];
    _imageFullRes = json['Image_Full_Res'];
    _imageFullRes2 = json['Image_Full_Res_2'];
    _imageFullRes3 = json['Image_Full_Res_3'];
    _imageFullRes4 = json['Image_Full_Res_4'];
    _imageFullRes5 = json['Image_Full_Res_5'];
    _priceDropDate = json['Price_Drop_Date'];
    _priceDropTime = json['Price_Drop_Time'];
    _asin = json['ASIN'];
    _priceHistory = json['Price_History'];
    _priceHistoryLocal = json['Price_History_Local'];
    _priceHistoryDownloaded = json['Price_History_Downloaded'];
    _spanishText = json['Spanish_Text'];
    _spanishTextTranslated = json['Spanish_Text_Translated'];
    _spanishProdDescriptionFull = json['Spanish_Prod_Description_Full'];
    _spanishModifiedToHtml = json['spanish_modified_to_html'];
    _stars = json['stars'];
    _superclipStatus = json['Superclip_Status'];
    _superclipExtraDiscount = json['Superclip_extra_discount'];
    _validDateModified = json['Valid_Date_Modified'];
    _fBSent = json['FB_sent'];
    _id = json['id'];
    _primeExclusivePrice = json['Prime_Exclusive_Price'];
  }
  String? _discount;
  String? _promoCode;
  String? _couponReadyForUse;
  String? _category;
  String? _categoryEnglish;
  dynamic _promoStartDate;
  dynamic _promoStartTime;
  String? _htmlLink;
  dynamic _validDate;
  dynamic _standardLink;
  String? _standardLinkSpanish;
  String? _standardLinkEnglish;
  dynamic _shortLink;
  dynamic _promoDescription;
  String? _englishShortProductDescription;
  String? _englishProdDescriptionFull;
  String? _englishModifiedToHtml;
  String? _reviews;
  dynamic _dollar;
  dynamic _cents;
  String? _regularPrice;
  String? _finalPrice;
  String? _totalSavings;
  String? _isPriceUpdated;
  dynamic _stock;
  String? _imageURL;
  dynamic _imageFullRes;
  String? _imageFullRes2;
  String? _imageFullRes3;
  String? _imageFullRes4;
  String? _imageFullRes5;
  String? _priceDropDate;
  String? _priceDropTime;
  String? _asin;
  dynamic _priceHistory;
  String? _priceHistoryLocal;
  dynamic _priceHistoryDownloaded;
  String? _spanishText;
  String? _spanishTextTranslated;
  String? _spanishProdDescriptionFull;
  String? _spanishModifiedToHtml;
  String? _stars;
  dynamic _superclipStatus;
  dynamic _superclipExtraDiscount;
  String? _validDateModified;
  String? _fBSent;
  String? _id;
  String? _primeExclusivePrice;
Data copyWith({  String? discount,
  String? promoCode,
  String? couponReadyForUse,
  String? category,
  String? categoryEnglish,
  dynamic promoStartDate,
  dynamic promoStartTime,
  String? htmlLink,
  dynamic validDate,
  dynamic standardLink,
  String? standardLinkSpanish,
  String? standardLinkEnglish,
  dynamic shortLink,
  dynamic promoDescription,
  String? englishShortProductDescription,
  String? englishProdDescriptionFull,
  String? englishModifiedToHtml,
  String? reviews,
  dynamic dollar,
  dynamic cents,
  String? regularPrice,
  String? finalPrice,
  String? totalSavings,
  String? isPriceUpdated,
  dynamic stock,
  String? imageURL,
  dynamic imageFullRes,
  String? imageFullRes2,
  String? imageFullRes3,
  String? imageFullRes4,
  String? imageFullRes5,
  String? priceDropDate,
  String? priceDropTime,
  String? asin,
  dynamic priceHistory,
  String? priceHistoryLocal,
  dynamic priceHistoryDownloaded,
  String? spanishText,
  String? spanishTextTranslated,
  String? spanishProdDescriptionFull,
  String? spanishModifiedToHtml,
  String? stars,
  dynamic superclipStatus,
  dynamic superclipExtraDiscount,
  String? validDateModified,
  String? fBSent,
  String? id,
  String? primeExclusivePrice,
}) => Data(  discount: discount ?? _discount,
  promoCode: promoCode ?? _promoCode,
  couponReadyForUse: couponReadyForUse ?? _couponReadyForUse,
  category: category ?? _category,
  categoryEnglish: categoryEnglish ?? _categoryEnglish,
  promoStartDate: promoStartDate ?? _promoStartDate,
  promoStartTime: promoStartTime ?? _promoStartTime,
  htmlLink: htmlLink ?? _htmlLink,
  validDate: validDate ?? _validDate,
  standardLink: standardLink ?? _standardLink,
  standardLinkSpanish: standardLinkSpanish ?? _standardLinkSpanish,
  standardLinkEnglish: standardLinkEnglish ?? _standardLinkEnglish,
  shortLink: shortLink ?? _shortLink,
  promoDescription: promoDescription ?? _promoDescription,
  englishShortProductDescription: englishShortProductDescription ?? _englishShortProductDescription,
  englishProdDescriptionFull: englishProdDescriptionFull ?? _englishProdDescriptionFull,
  englishModifiedToHtml: englishModifiedToHtml ?? _englishModifiedToHtml,
  reviews: reviews ?? _reviews,
  dollar: dollar ?? _dollar,
  cents: cents ?? _cents,
  regularPrice: regularPrice ?? _regularPrice,
  finalPrice: finalPrice ?? _finalPrice,
  totalSavings: totalSavings ?? _totalSavings,
  isPriceUpdated: isPriceUpdated ?? _isPriceUpdated,
  stock: stock ?? _stock,
  imageURL: imageURL ?? _imageURL,
  imageFullRes: imageFullRes ?? _imageFullRes,
  imageFullRes2: imageFullRes2 ?? _imageFullRes2,
  imageFullRes3: imageFullRes3 ?? _imageFullRes3,
  imageFullRes4: imageFullRes4 ?? _imageFullRes4,
  imageFullRes5: imageFullRes5 ?? _imageFullRes5,
  priceDropDate: priceDropDate ?? _priceDropDate,
  priceDropTime: priceDropTime ?? _priceDropTime,
  asin: asin ?? _asin,
  priceHistory: priceHistory ?? _priceHistory,
  priceHistoryLocal: priceHistoryLocal ?? _priceHistoryLocal,
  priceHistoryDownloaded: priceHistoryDownloaded ?? _priceHistoryDownloaded,
  spanishText: spanishText ?? _spanishText,
  spanishTextTranslated: spanishTextTranslated ?? _spanishTextTranslated,
  spanishProdDescriptionFull: spanishProdDescriptionFull ?? _spanishProdDescriptionFull,
  spanishModifiedToHtml: spanishModifiedToHtml ?? _spanishModifiedToHtml,
  stars: stars ?? _stars,
  superclipStatus: superclipStatus ?? _superclipStatus,
  superclipExtraDiscount: superclipExtraDiscount ?? _superclipExtraDiscount,
  validDateModified: validDateModified ?? _validDateModified,
  fBSent: fBSent ?? _fBSent,
  id: id ?? _id,
  primeExclusivePrice: primeExclusivePrice ?? _primeExclusivePrice,
);
  String? get discount => _discount;
  String? get promoCode => _promoCode;
  String? get couponReadyForUse => _couponReadyForUse;
  String? get category => _category;
  String? get categoryEnglish => _categoryEnglish;
  dynamic get promoStartDate => _promoStartDate;
  dynamic get promoStartTime => _promoStartTime;
  String? get htmlLink => _htmlLink;
  dynamic get validDate => _validDate;
  dynamic get standardLink => _standardLink;
  String? get standardLinkSpanish => _standardLinkSpanish;
  String? get standardLinkEnglish => _standardLinkEnglish;
  dynamic get shortLink => _shortLink;
  dynamic get promoDescription => _promoDescription;
  String? get englishShortProductDescription => _englishShortProductDescription;
  String? get englishProdDescriptionFull => _englishProdDescriptionFull;
  String? get englishModifiedToHtml => _englishModifiedToHtml;
  String? get reviews => _reviews;
  dynamic get dollar => _dollar;
  dynamic get cents => _cents;
  String? get regularPrice => _regularPrice;
  String? get finalPrice => _finalPrice;
  String? get totalSavings => _totalSavings;
  String? get isPriceUpdated => _isPriceUpdated;
  dynamic get stock => _stock;
  String? get imageURL => _imageURL;
  dynamic get imageFullRes => _imageFullRes;
  String? get imageFullRes2 => _imageFullRes2;
  String? get imageFullRes3 => _imageFullRes3;
  String? get imageFullRes4 => _imageFullRes4;
  String? get imageFullRes5 => _imageFullRes5;
  String? get priceDropDate => _priceDropDate;
  String? get priceDropTime => _priceDropTime;
  String? get asin => _asin;
  dynamic get priceHistory => _priceHistory;
  String? get priceHistoryLocal => _priceHistoryLocal;
  dynamic get priceHistoryDownloaded => _priceHistoryDownloaded;
  String? get spanishText => _spanishText;
  String? get spanishTextTranslated => _spanishTextTranslated;
  String? get spanishProdDescriptionFull => _spanishProdDescriptionFull;
  String? get spanishModifiedToHtml => _spanishModifiedToHtml;
  String? get stars => _stars;
  dynamic get superclipStatus => _superclipStatus;
  dynamic get superclipExtraDiscount => _superclipExtraDiscount;
  String? get validDateModified => _validDateModified;
  String? get fBSent => _fBSent;
  String? get id => _id;
  String? get primeExclusivePrice => _primeExclusivePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Discount'] = _discount;
    map['Promo_Code'] = _promoCode;
    map['coupon_ready_for_use'] = _couponReadyForUse;
    map['Category'] = _category;
    map['Category_English'] = _categoryEnglish;
    map['Promo_Start_Date'] = _promoStartDate;
    map['Promo_Start_Time'] = _promoStartTime;
    map['Html_Link'] = _htmlLink;
    map['Valid_Date'] = _validDate;
    map['Standard_Link'] = _standardLink;
    map['Standard_Link_Spanish'] = _standardLinkSpanish;
    map['Standard_Link_English'] = _standardLinkEnglish;
    map['Short_Link'] = _shortLink;
    map['Promo_description'] = _promoDescription;
    map['English_Short_Product_Description'] = _englishShortProductDescription;
    map['English_Prod_Description_Full'] = _englishProdDescriptionFull;
    map['english_modified_to_html'] = _englishModifiedToHtml;
    map['Reviews'] = _reviews;
    map['Dollar'] = _dollar;
    map['Cents'] = _cents;
    map['Regular_Price'] = _regularPrice;
    map['Final_Price'] = _finalPrice;
    map['Total_Savings'] = _totalSavings;
    map['is_price_updated'] = _isPriceUpdated;
    map['Stock'] = _stock;
    map['Image_URL'] = _imageURL;
    map['Image_Full_Res'] = _imageFullRes;
    map['Image_Full_Res_2'] = _imageFullRes2;
    map['Image_Full_Res_3'] = _imageFullRes3;
    map['Image_Full_Res_4'] = _imageFullRes4;
    map['Image_Full_Res_5'] = _imageFullRes5;
    map['Price_Drop_Date'] = _priceDropDate;
    map['Price_Drop_Time'] = _priceDropTime;
    map['ASIN'] = _asin;
    map['Price_History'] = _priceHistory;
    map['Price_History_Local'] = _priceHistoryLocal;
    map['Price_History_Downloaded'] = _priceHistoryDownloaded;
    map['Spanish_Text'] = _spanishText;
    map['Spanish_Text_Translated'] = _spanishTextTranslated;
    map['Spanish_Prod_Description_Full'] = _spanishProdDescriptionFull;
    map['spanish_modified_to_html'] = _spanishModifiedToHtml;
    map['stars'] = _stars;
    map['Superclip_Status'] = _superclipStatus;
    map['Superclip_extra_discount'] = _superclipExtraDiscount;
    map['Valid_Date_Modified'] = _validDateModified;
    map['FB_sent'] = _fBSent;
    map['id'] = _id;
    map['Prime_Exclusive_Price'] = _primeExclusivePrice;
    return map;
  }

}