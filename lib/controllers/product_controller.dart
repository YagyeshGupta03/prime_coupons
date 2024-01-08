import 'package:clipeate_project/controllers/favorite_controller.dart';
import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:clipeate_project/screens/dashboard/product_details.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../helper/api_urls.dart';
import '../helper/http_helper.dart';
import '../helper/models/ProductModel.dart' as product;
import 'category_controller.dart';

class ProductController extends GetxController {
  List<product.Data>? productList = [];
  List<product.Data>? latestDealsList = [];
  List<product.Data>? trendingDealsList = [];
  List<product.Data>? upcomingDealsList = [];
  List<product.Data>? underTenDeals = [];

  product.ProductModel? productDetails;

  final FavoriteController favoriteController = Get.put(FavoriteController());

  //
  //
  //get all deals
  getAllDeals(offset, limit, clear) async {
    if (clear) {
      productList!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      favoriteController.getFavCoupons(true);
    }
    final NetworkHelper networkHelper = NetworkHelper(url: allDealsUrl);
    var reply = await networkHelper.postData({
      'offset': offset,
      'limit': limit,
    });

    print(reply);
    product.ProductModel model = product.ProductModel.fromJson(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        productList!.add(element);
      });
      update();
      print('product received');
    } else {
      print(model.message);
    }
  }

  //
  //
  //get latest deals
  bool latestLoad = false;
  getLatestDeals(offset, limit, clear) async {
    latestLoad = true;
    update();
    if (clear) {
      latestDealsList!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      favoriteController.getFavCoupons(true);
    }
    final NetworkHelper networkHelper = NetworkHelper(url: latestDealsUrl);
    var reply = await networkHelper.postData({
      'offset': offset,
      'limit': limit,
    });

    product.ProductModel model = product.ProductModel.fromJson(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        latestDealsList!.add(element);
      });
      update();
      print('latest deals received');
    } else {
      print(model.message);
      latestLoad = false;
      update();
    }
  }

  //
  //
  //get trending deals
  bool trendingLoad = false;
  getTrendingDeals(offset, limit, bool clear) async {
    trendingLoad = true;
    update();

    if (clear) {
      trendingDealsList!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      favoriteController.getFavCoupons(true);
    }
    final NetworkHelper networkHelper = NetworkHelper(url: trendingDealsUrl);
    var reply = await networkHelper.postData({
      'offset': offset,
      'limit': limit,
    });

    print(reply);
    product.ProductModel model = product.ProductModel.fromJson(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        trendingDealsList!.add(element);
      });
      update();
    } else {
      trendingLoad = false;
      update();
      print(model.message);
    }
  }

  //
  //
  //get upcoming deals
  bool upcomingLoad = false;
  getUpcomingDeals(offset, limit, bool clear) async {
    upcomingLoad = true;
    update();

    if (clear) {
      upcomingDealsList!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      favoriteController.getFavCoupons(true);
    }
    final NetworkHelper networkHelper = NetworkHelper(url: upcomingDealsUrl);
    var reply = await networkHelper.postData({
      'offset': offset,
      'limit': limit,
    });

    print(reply);
    if (reply['status'] == 1) {
      product.ProductModel model = product.ProductModel.fromJson(reply);
      model.data!.forEach((element) {
        upcomingDealsList!.add(element);
      });
      update();
    } else {
      upcomingLoad = false;
      update();
      print(reply['message']);
    }
  }

  //
  //
  //get under 10 deals
  bool underLoad = false;
  getUnderTenDeals(offset, limit, clear) async {
    underLoad = true;
    update();

    if (clear) {
      underTenDeals!.clear();
    }

    if (credentialController.userId == '') {
    } else {
      favoriteController.getFavCoupons(true);
    }
    final NetworkHelper networkHelper = NetworkHelper(url: underTenUrl);
    var reply = await networkHelper.postData({
      'offset': offset,
      'limit': limit,
    });

    print(reply);
    product.ProductModel model = product.ProductModel.fromJson(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        underTenDeals!.add(element);
      });
      update();
    } else {
      print(model.message);
      underLoad = false;
      update();
    }
  }

  //
  //
  // get product details
  getProductDetails(context, link) async {
    final NetworkHelper networkHelper = NetworkHelper(url: link);
    var reply = await networkHelper.postData({});

    if (reply['status'] == 1) {
      productDetails = product.ProductModel.fromJson(reply);
      update();
      Get.find<CategoryController>().getRelatedProducts(
          Intl.getCurrentLocale() == 'en'
              ? productDetails!.data![0].categoryEnglish.toString()
              : productDetails!.data![0].category.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(data: productDetails!.data![0]),
        ),
      );
    } else {
      print(reply['message']);
    }
  }

  //
  //
  //
  String couponsCount = '';
  getCouponsCount() async {
    final NetworkHelper networkHelper = NetworkHelper(url: couponsCountUrl);
    var reply = await networkHelper.postData({});

    if (reply['status'] == 1) {
      couponsCount = reply['data']['total'];
      update();
    } else {
      print(reply['message']);
    }
  }
}
