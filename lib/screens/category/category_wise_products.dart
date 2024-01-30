import 'package:clipeate_project/controllers/category_controller.dart';
import 'package:clipeate_project/screens/dashboard/home_screen.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../helper/api_urls.dart';
import '../../widgets/constants.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/product_details.dart';

class CategoryWiseProduct extends StatefulWidget {
  const CategoryWiseProduct({super.key, required this.category});

  final String category;

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/filter');
          },
          child: Container(
            height: 10,
            width: 10,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Image.asset(IconConst().filter,
                height: 10, width: 10, fit: BoxFit.fill),
          ),
        ),
        title: CustomSearchBar(
          enabled: false,
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '1',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen(
                                newScreen: HomeScreen())));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_outlined, color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).home,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '2',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DashboardScreen(newScreen: AllDeals())));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.handshake_outlined,
                          color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).allDeals,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '3',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DashboardScreen(newScreen: Upcoming())));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.watch_later_outlined,
                          color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).upcoming,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '3',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DashboardScreen(newScreen: Under10())));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.monetization_on_outlined,
                          color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        '${S.of(context).under} \$ 10',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '4',
                  onTap: () async {
                    if (!await launchUrl(Uri.parse(blogLink))) {
                      throw Exception('Could not launch $blogLink');
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.info, color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).blog,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              offset = offset + 10;
              Get.find<CategoryController>()
                  .getCategoryProducts(widget.category, '$offset', '$limit');
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.2)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSlider(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(widget.category,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              GetBuilder<CategoryController>(
                builder: (CategoryController controller) {
                  return controller.categoryProductList!.isNotEmpty
                      ? Column(
                          children: [
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 380,
                                mainAxisSpacing: 10.0,
                              ),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.categoryProductList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SearchCard(
                                    onTap: () {
                                      Get.find<CategoryController>()
                                          .getRelatedProducts(Intl
                                                      .getCurrentLocale() ==
                                                  'en'
                                              ? controller
                                                  .categoryProductList![index]
                                                  .categoryEnglish
                                                  .toString()
                                              : controller
                                                  .categoryProductList![index]
                                                  .category
                                                  .toString());
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DashboardScreen(
                                              catScreen: ProductDetailsScreen(
                                                  data: controller
                                                          .categoryProductList![
                                                      index]),
                                              index: 1),
                                        ),
                                      );
                                    },
                                    data:
                                        controller.categoryProductList![index]);
                              },
                            ),
                            const SizedBox(height: 10),
                            controller.loading
                                ? const Row(
                                    children: [
                                      ShimmerCard(),
                                      SizedBox(width: 10),
                                      ShimmerCard(),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              S.of(context).noProductsFound,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
