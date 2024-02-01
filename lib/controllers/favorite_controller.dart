import 'package:clipeate_project/helper/api_urls.dart';
import 'package:clipeate_project/helper/models/FavoriteModel.dart' as favorite;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../helper/http_helper.dart';
import 'global_controllers.dart';

class FavoriteController extends GetxController {
  bool loading = false;
  bool fbLoading = false;
  List<favorite.Data>? favoriteList = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  //To sign in with google
  Future<UserCredential?> signInWithGoogle(context) async {
    String fcmToken = '';

    loading = true;
    update();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      fcmToken = await _firebaseMessaging.getToken() ?? '';

      final NetworkHelper networkHelper = NetworkHelper(url: userSignInUrl);
      var reply = await networkHelper.postData({
        'name': '${user?.displayName}',
        'oauth_provider': 'google',
        'oauth_id': fcmToken.toString(),
        'email': '${user?.email}',
      });

      print(reply);

      if (reply['status'] == 1) {
        await credentialController.setUserInfo(
            reply['data']['user_id'], reply['data']['email']);
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'Signed in successfully',
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.green);
        loading = false;
        update();
      } else {
        Fluttertoast.showToast(
            msg: reply['msg'],
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.red);
        loading = false;
        update();
      }
    } catch (error) {
      loading = false;
      update();
      print("Google Sign In Error: $error");
      return null;
    }
  }

  //
  //
  Future<UserCredential?> signInWithGoogleWithFav(context) async {
    String fcmToken = '';

    loading = true;
    update();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      fcmToken = await _firebaseMessaging.getToken() ?? '';

      final NetworkHelper networkHelper = NetworkHelper(url: userSignInUrl);
      var reply = await networkHelper.postData({
        'name': '${user?.displayName}',
        'oauth_provider': 'google',
        'oauth_id': fcmToken.toString(),
        'email': '${user?.email}',
      });

      print(reply);

      if (reply['status'] == 1) {
        await credentialController.setUserInfo(
            reply['data']['user_id'], reply['data']['email']);
        // await Navigator.pushNamed(context, '/dashboard');
        getFavCoupons(true);
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'Signed in successfully',
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.green);
        loading = false;
        update();
      } else {
        Fluttertoast.showToast(
            msg: reply['msg'],
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.red);
        loading = false;
        update();
      }
    } catch (error) {
      loading = false;
      update();
      print("Google Sign In Error: $error");
      return null;
    }
  }

  //
  //
  Future<UserCredential?> signInWithFacebook(context) async {
    String fcmToken = '';

    fbLoading = true;
    update();

    try {
        // Trigger the sign-in flow
        final LoginResult loginResult = await FacebookAuth.instance.login();

        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);


      User? user = userCredential.user;

      fcmToken = await _firebaseMessaging.getToken() ?? '';

      final NetworkHelper networkHelper = NetworkHelper(url: userSignInUrl);
      var reply = await networkHelper.postData({
        'name': '${user?.displayName}',
        'oauth_provider': 'google',
        'oauth_id': fcmToken.toString(),
        'email': '${user?.email}',
      });

      print(reply);

      if (reply['status'] == 1) {
        await credentialController.setUserInfo(
            reply['data']['user_id'], reply['data']['email']);
        getFavCoupons(true);
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'Signed in successfully',
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.green);
        loading = false;
        update();
      } else {
        Fluttertoast.showToast(
            msg: reply['msg'],
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.red);
        loading = false;
        update();
      }
        fbLoading = false;
        update();
    } catch (error) {
      fbLoading = false;
      update();
      print("Google Sign In Error: $error");
      return null;
    }
  }

  //
  //add products to favorite list
  addToFav(context, productAsin, description, expiry, discount, regularPrice,
      discountPrice, productImage) async {

    final NetworkHelper networkHelper = NetworkHelper(url: addFavUrl);
    var reply = await networkHelper.postData({
      'user_id': credentialController.userId,
      'product_asin': productAsin,
      'product_description': description,
      'offer_expiration': expiry ?? '0000-00-00',
      'discount': discount,
      'regular_price': regularPrice,
      'discount_price': discountPrice,
      'product_image_url': productImage,
    });

    if (reply['status'] == 1) {
      getFavCoupons(false);
      update();
    } else {
      getFavCoupons(true);
      update();
      Fluttertoast.showToast(
          msg: reply['message'],
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red);
    }
  }

  //
  //get favorite list
  bool favLoad = false;
  getFavCoupons(bool clear) async {
    favLoad = true;
    update();

    if (clear) {
      favoriteList!.clear();
    }

    final NetworkHelper networkHelper = NetworkHelper(url: getFavUrl);
    var reply = await networkHelper.postData({
      'user_id': credentialController.userId,
    });

    print(reply);
    favorite.FavoriteModel model = favorite.FavoriteModel.fromJson(reply);
    if (reply['status'] == 1) {
      for (var element in model.data!) {
        favoriteList!.add(element);
        update();
      }
      favLoad = false;
      update();
      print('Favorites received');
    } else {
      favLoad = false;
      update();
      print(reply['message']);
    }
    favLoad = false;
    update();
  }

  getFavourite(String productId) {
    return favoriteList!
        .where((element) => element.productAsin == productId)
        .toList()
        .isNotEmpty;
  }
}
