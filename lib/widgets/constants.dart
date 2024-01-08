import 'package:flutter/material.dart';


// Dynamic screen width
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Dynamic screen height
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//App bar height
double barHeight() {
  return 90.0;
}

class AppUi{
  final primaryColor = const Color(0xff3C9099);
  final filterClr = const Color(0xffE3E2C3);
  final primaryLightClr = const Color(0xff5FBDB0);
}


class ImageConst{
  final logo = 'assets/images/logo.png';
  final google = 'assets/images/google.png';
  final facebook = 'assets/images/facebook.png';
  final usFlag = 'assets/images/us.jpg';
  final spainFlag = 'assets/images/spain.png';
  final availableAtAmazon = 'assets/images/available.png';

  //dummy products
  final watch = 'assets/images/dummies/watch.jpg';
  final laptop = 'assets/images/dummies/laptop.jpg';
  final headphone = 'assets/images/dummies/headphone.jpg';
  final grocery = 'assets/images/dummies/grocery.jpg';
  final bag = 'assets/images/dummies/bag.jpg';
  final music = 'assets/images/dummies/music.png';
  final icGrocery = 'assets/images/dummies/grocery.png';
  final gadgets = 'assets/images/dummies/gadgets.png';
  final slider = 'assets/images/dummies/slider.jpg';
  final slider2 = 'assets/images/dummies/slider2.jpg';
  final slider3 = 'assets/images/dummies/slider3.jpg';
  final slider4 = 'assets/images/dummies/slider4.jpg';
  final slider5 = 'assets/images/dummies/slider5.jpg';
  final slider6 = 'assets/images/dummies/slider6.jpg';
  final cosori = 'assets/images/dummies/cosori.jpg';
  final blog = 'assets/images/dummies/blog.jpg';
  final profile = 'assets/images/dummies/dummy_profile.jpg';
  final dummyProfile = 'assets/images/dummies/profile.png';
  final splash = 'assets/images/dummies/dummy_splash.jpg';
}


class IconConst{
  final filter = 'assets/icons/filter.png';
}


convertToCurrency(price){
  return '${price}';
}