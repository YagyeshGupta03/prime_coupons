import 'package:clipeate_project/controllers/credential_controller.dart';
import 'package:clipeate_project/controllers/product_controller.dart';
import 'package:clipeate_project/helper/api_urls.dart';
import 'package:clipeate_project/screens/category/categories_screen.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/screens/setting/settings_screen.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import '../../helper/fcm_helper.dart';
import '../favorites/favorite_screen.dart';

class DashboardScreen extends StatefulWidget {
  final Widget? newScreen;
  final Widget? catScreen;
  final Widget? favScreen;
  final Widget? setScreen;
  final int? index;

  const DashboardScreen(
      {super.key,
      this.newScreen,
      this.catScreen,
      this.index,
      this.favScreen,
      this.setScreen});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  bool allow = true;
  bool backToAllDeals = false;

  @override
  void initState() {
    super.initState();
    FCM().setNotifications(context);
    generateLink(context);
  }

  generateLink(context) async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      await Future.delayed(const Duration(milliseconds: 500));
      Get.find<ProductController>()
          .getProductDetails(context, deepLink.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    List screen = [
      backToAllDeals ? const AllDeals() : widget.newScreen ?? const AllDeals(),
      allow
          ? widget.catScreen ?? const CategoriesScreen()
          : const CategoriesScreen(),
      widget.favScreen ?? const FavoriteScreen(),
      widget.setScreen ??
          GetBuilder<CredentialController>(
            builder: (CredentialController controller) {
              if (controller.userId == '') {
                return const SettingScreen();
              } else {
                return const SettingLogScreen();
              }
            },
          )
    ];
    return Scaffold(
      body: screen
          .elementAt(allow ? widget.index ?? selectedIndex : selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black54, width: 1.2))),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: S.of(context).allDeals,
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: const Icon(Icons.category),
                label: S.of(context).category),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
                label: S.of(context).favorites),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: S.of(context).settings),
          ],
          currentIndex: allow ? widget.index ?? selectedIndex : selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppUi().primaryColor,
          onTap: (val) {
            allow = false;
            selectedIndex = val;
            backToAllDeals = true;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class HomeClass extends StatefulWidget {
  const HomeClass({super.key, required this.link});

  final String link;
  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.link),
      ),
    );
  }
}
