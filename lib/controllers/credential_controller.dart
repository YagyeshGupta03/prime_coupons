import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CredentialController extends GetxController {
  String language = 'en';
  String userId = '';
  String email = '';
  bool loading = false;
  //
  //
  //
  //
  void setLanguage(lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(lang);
    await prefs.setString('language', lang);
    language = prefs.getString('language') ?? 'en';
    Get.updateLocale(Locale(lang));
    update();
  }
  //
  //
  //
  //
  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'en';
    update();
  }
  //
  //
  //
  //
   setUserInfo(id, mail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', id);
    await prefs.setString('email', mail);
    userId = prefs.getString('user_id') ?? '';
    email = prefs.getString('email') ?? '';
    update();
  }
  //
  //
  //
  //
  deleteUserInfo(id, mail) async {
    loading = true;
    update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', id);
    await prefs.setString('email', mail);
    userId = prefs.getString('user_id') ?? '';
    email = prefs.getString('email') ?? '';
    loading = false;
    update();
  }
  //
  //
  //
  //
  getUserInfo(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id') ?? '';
    email = prefs.getString('email') ?? '';
    update();
    Navigator.pushReplacementNamed(context, '/dashboard');
  }
  //
  //
  //
  //
  Future connectionChecking(context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      getUserInfo(context);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      getUserInfo(context);
    } else if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushReplacementNamed(context, '/noConnection');
      Fluttertoast.showToast(
        msg: "No internet connection",
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
      );
    }
  }
}
