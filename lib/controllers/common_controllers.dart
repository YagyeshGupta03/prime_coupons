import 'package:clipeate_project/helper/models/ProductModel.dart' as product;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/api_urls.dart';
import '../helper/http_helper.dart';
import '../helper/models/firebase_model.dart';
import '../widgets/widgets.dart';
import 'favorite_controller.dart';
import 'global_controllers.dart';

//
//
//to set app language
class LanguageController extends GetxController {
  final availableLanguages = ['en', 'es']; // Add more languages as needed

  Object _currentLanguage = credentialController.language;

  Object get currentLanguage => _currentLanguage;

  void changeLanguage(String newLanguage) {
    if (availableLanguages.contains(newLanguage)) {
      _currentLanguage = newLanguage;
      Get.updateLocale(Locale(newLanguage));
    }
  }
}

//
//
//get searched products list
class SearchingController extends GetxController {
  List<product.Data>? searchList = [];
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  bool loading = false;

  getSearchResults(search, offset, limit) async {
    loading = true;
    update();

    searchList!.clear();

    if (credentialController.userId == '') {
    } else {
      _favoriteController.getFavCoupons(true);
    }

    final NetworkHelper networkHelper = NetworkHelper(url: searchUrl);
    var reply = await networkHelper.postData({
      'search': search,
      'site_lang': language(),
      'offset': offset,
      'limit': limit,
    });

    product.ProductModel model = product.ProductModel.fromJson(reply);

    print(reply);

    if (model.status == 1) {
      model.data!.forEach((element) {
        searchList!.add(element);
      });
      update();
      loading = false;
      update();
    } else {
      print(model.message);
      loading = false;
      update();
    }
  }

  searchContinue(search, offset, limit) async {
    loading = true;
    update();

    if (credentialController.userId == '') {
    } else {
      _favoriteController.getFavCoupons(true);
    }

    final NetworkHelper networkHelper = NetworkHelper(url: searchUrl);
    var reply = await networkHelper.postData({
      'search': search,
      'site_lang': language(),
      'offset': offset,
      'limit': limit,
    });

    product.ProductModel model = product.ProductModel.fromJson(reply);

    if (model.status == 1) {
      model.data!.forEach((element) {
        searchList!.add(element);
      });
      update();
      loading = false;
      update();
    } else {
      print(model.message);
      loading = false;
      update();
    }
  }
}

//
//
//get filtered products list
class FilterController extends GetxController {
  List<product.Data>? filterList = [];
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  bool loading = false;
  bool afterLoading = false;

  //
  //
  // get filtered products
  getFilteredResults(min, max, status, category, sorting, minDis, maxDis,
      offset, limit, bool clear, bool loader, bool afterLoader) async {
    if (afterLoader) {
      afterLoading = true;
      update();
    }

    if (loader) {
      loading = true;
      update();
    }

    if (clear) {
      filterList!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      _favoriteController.getFavCoupons(true);
    }

    final NetworkHelper networkHelper = NetworkHelper(url: filterUrl);
    var reply = await networkHelper.postData({
      'min_price': min,
      'max_price': max,
      'site_lang': language(),
      'status': status,
      'category': category,
      'sorting': sorting,
      'min_discounts': minDis,
      'max_discounts': maxDis,
      'offset': offset,
      'limit': limit,
    });

    product.ProductModel model = product.ProductModel.fromJson(reply);
    print(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        filterList!.add(element);
      });
      update();
      loading = false;
      afterLoading = false;
      update();
    } else {
      print(model.message);
      loading = false;
      afterLoading = false;
      update();
    }
    loading = false;
    afterLoading = false;
    update();
  }
}

//
//
//
class FirebaseController extends GetxController {
  List<CarouselImagesModel> carouselItemsList = [];
  List<TopCategoriesModel> topCategoriesList = [];

  //
  //
  //fetch carousal sliders data from firebase
  Future<void> fetchCarouselItems() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Carousel').get();

      carouselItemsList
          .assignAll(await Future.wait(snapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data();

        String imagePath = data['image'] ?? '';
        String imageUrl = await getDownloadUrl(imagePath);

        return CarouselImagesModel(
          image: imageUrl,
          link: data['link'] ?? '',
          category: data['category'] ?? '',
        );
      }).toList()));

      update();
    } catch (e) {
      print('Error fetching carousel items: $e');
    }
  }

  //generate url of images from firebase storage
  Future<String> getDownloadUrl(String imagePath) async {
    String downloadUrl = '';

    Reference storageReference =
        FirebaseStorage.instance.ref().child(imagePath);

    try {
      downloadUrl = await storageReference.getDownloadURL();
    } catch (e) {
      print('Error getting download URL: $e');
    }

    return downloadUrl;
  }

  //
  //
  //fetch top categories data from firebase
  Future<void> fetchTopCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Categories').get();

      topCategoriesList
          .assignAll(await Future.wait(snapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data();

        return TopCategoriesModel(
            titleSpanish: data['title_spanish'] ?? '',
            titleEnglish: data['title_english'] ?? '',
            catEnglish: data['category_english'] ?? '',
            catSpanish: data['category_spanish'] ?? '');
      }).toList()));

      update();
    } catch (e) {
      print('Error fetching top categories: $e');
    }
  }
}


