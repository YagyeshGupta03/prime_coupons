import 'package:clipeate_project/helper/api_urls.dart';
import 'package:clipeate_project/helper/models/CategoryModel.dart' as category;
import 'package:get/get.dart';
import '../helper/http_helper.dart';
import '../helper/models/ProductModel.dart' as product;
import '../widgets/widgets.dart';
import 'favorite_controller.dart';
import 'global_controllers.dart';


class CategoryController extends GetxController {
  List<category.Data>? categoryList = [];
  String baseUrl = '';
  List<product.Data>? categoryProductList = [];
  List<product.Data>? relatedProductList = [];
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  bool loading = false;


  //get all categories
  getCategories() async {
    final NetworkHelper networkHelper = NetworkHelper(url: categoryUrl);
    var reply = await networkHelper.postData({});
    category.CategoryModel model = category.CategoryModel.fromJson(reply);
    if (model.status == 1) {
      categoryList = model.data;
     baseUrl = model.baseUrl.toString();
      update();
    } else {
      print(model.message);
    }
  }

  //
  //
  //get products according to category
  getCategoryProducts(category, offset, limit) async {
    loading = true;
    update();

    if(credentialController.userId == ''){} else {
      _favoriteController.getFavCoupons(true);
    }

    final NetworkHelper networkHelper = NetworkHelper(url: categoryProductsUrl);
    var reply = await networkHelper.postData({
      'category': category,
      'site_lang': language(),
      'offset': offset,
      'limit': limit,
    });

    print(reply);
    product.ProductModel model = product.ProductModel.fromJson(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        categoryProductList!.add(element);
      });
      update();
    } else {
      print(model.message);
      loading = false;
      update();
    }
  }

  //
  //
  //get related products of same category
  getRelatedProducts(category) async {
    loading = true;
    update();

    if(credentialController.userId == ''){} else {
      _favoriteController.getFavCoupons(true);
    }

    final NetworkHelper networkHelper = NetworkHelper(url: categoryProductsUrl);
    var reply = await networkHelper.postData({
      'category': category,
      'site_lang': language(),
      'offset': '0',
      'limit': '10',
    });

    relatedProductList!.clear();

    product.ProductModel model = product.ProductModel.fromJson(reply);
    print(reply);
    if (model.status == 1) {
      model.data!.forEach((element) {
        relatedProductList!.add(element);
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


