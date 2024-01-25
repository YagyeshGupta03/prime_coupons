import 'package:carousel_slider/carousel_slider.dart';
import 'package:clipeate_project/controllers/common_controllers.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/product_controller.dart';
import '../../generated/l10n.dart';
import '../../helper/api_urls.dart';
import '../../widgets/constants.dart';
import '../category/category_wise_products.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  onTap: () {},
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
                                const DashboardScreen(newScreen: Trending())));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.stacked_line_chart,
                          color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).trending,
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
                  value: '5',
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
                  value: '6',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Center(
              child: Text(
                  S.of(context).welcomeToPrimeCouponsAmazonCouponsAndDiscounts,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 20),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Column(
                children: [
                  CustomSlider(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).latestDeals,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/latest');
                    },
                    child: Text(
                      S.of(context).viewAll,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppUi().primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<ProductController>(
              initState: (_) {
                Get.find<ProductController>().getLatestDeals('0', '6', true);
              },
              builder: (ProductController controller) {
                if (controller.latestDealsList!.isNotEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 380,
                      mainAxisSpacing: 10.0,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ScrollCard(
                          upcoming: false,
                          data: controller.latestDealsList![index]);
                    },
                  );
                } else {
                  // return const Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         ShimmerCard(),
                  //         SizedBox(width: 10),
                  //         ShimmerCard(),
                  //       ],
                  //     ),
                  //     SizedBox(height: 15),
                  //     Row(
                  //       children: [
                  //         ShimmerCard(),
                  //         SizedBox(width: 10),
                  //         ShimmerCard(),
                  //       ],
                  //     ),
                  //   ],
                  // );
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text('No products found'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).trendingDeals,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/trending');
                    },
                    child: Text(
                      S.of(context).viewAll,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppUi().primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<ProductController>(
              initState: (_) {
                Get.find<ProductController>().getTrendingDeals('0', '6', true);
              },
              builder: (ProductController controller) {
                if (controller.trendingDealsList!.isNotEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 380,
                      mainAxisSpacing: 10.0,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ScrollCard(
                          upcoming: false,
                          data: controller.trendingDealsList![index]);
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text('No products found'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).upcomingDeals,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/upcoming');
                    },
                    child: Text(
                      S.of(context).viewAll,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppUi().primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<ProductController>(
              initState: (_) {
                Get.find<ProductController>().getUpcomingDeals('0', '6', true);
              },
              builder: (ProductController controller) {
                if (controller.upcomingDealsList!.isNotEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 380,
                      mainAxisSpacing: 10.0,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:  controller.upcomingDealsList!.length > 4
                        ? 4
                        : controller.upcomingDealsList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ScrollCard(
                          upcoming: true,
                          data: controller.upcomingDealsList![index]);
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text('No products found'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const CouponTutorial(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).underTen,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Text(
                  //     S.of(context).viewAll,
                  //     style: TextStyle(
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w600,
                  //         color: AppUi().primaryColor),
                  //   ),
                  // ),
                ],
              ),
            ),
            GetBuilder<ProductController>(
              initState: (_) {
                Get.find<ProductController>().getUnderTenDeals('0', '6', true);
              },
              builder: (ProductController controller) {
                if (controller.underTenDeals!.isEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 380,
                      mainAxisSpacing: 10.0,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.underTenDeals!.length > 4
                        ? 4
                        : controller.underTenDeals!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ScrollCard(
                          upcoming: false,
                          data: controller.underTenDeals![index]);
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text('No products found'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//
class CouponTutorial extends StatelessWidget {
  const CouponTutorial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppUi().primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              S.of(context).howToUseAmazonCouponCodes,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CircleSteps(
                point: '1',
                title: S.of(context).getAPrimeMembership,
                subtitle: S.of(context).forFreeShipping),
            const SizedBox(height: 20),
            CircleSteps(
                point: '2',
                title: S.of(context).visitPrimecouponscom,
                subtitle: S.of(context).clickActivateCoupon),
            const SizedBox(height: 20),
            CircleSteps(
                point: '3',
                title: S.of(context).confirmYourDiscount,
                subtitle: S.of(context).proceedWithCheckout),
          ],
        ),
      ),
    );
  }
}

//
//
//
class CircleSteps extends StatelessWidget {
  const CircleSteps({
    super.key,
    required this.point,
    required this.title,
    required this.subtitle,
  });

  final String point;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Text(point,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppUi().primaryColor))),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ],
    );
  }
}

//
//
//

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        color: AppUi().primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          width: screenWidth(context) / 2 - 30,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

//
//
//
class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _current = 0;
  final CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    Get.find<FirebaseController>().fetchCarouselItems();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseController>(
      builder: (FirebaseController controller) {
        return Column(
          children: [
            CarouselSlider(
              items: List.generate(
                controller.carouselItemsList.length,
                (index) => InkWell(
                  onTap: () async {
                    if (controller.carouselItemsList[index].link == '') {
                      if (controller.carouselItemsList[index].category == '') {
                        print('No category or link found');
                      } else {
                        Get.find<CategoryController>()
                            .categoryProductList!
                            .clear();
                        Get.find<CategoryController>().getCategoryProducts(
                            controller.carouselItemsList[index].category
                                .toString(),
                            '0',
                            '10');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(
                              index: 1,
                              catScreen: CategoryWiseProduct(
                                  category: controller
                                      .carouselItemsList[index].category
                                      .toString()),
                            ),
                          ),
                        );
                      }
                    } else {
                      if (!await launchUrl(Uri.parse(
                        controller.carouselItemsList[index].link.toString(),
                      ))) {
                        throw Exception('Could not launch');
                      }
                    }
                  },
                  child: Container(
                    width: screenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.carouselItemsList[index].image),
                          fit: BoxFit.fill),
                      color: Colors.transparent,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                  ),
                ),
              ),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  reverse: false,
                  aspectRatio: 1.8,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  controller.carouselItemsList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 12.0 : 12.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 1 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

//
//
//
class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              width: 150,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            const Divider(),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
