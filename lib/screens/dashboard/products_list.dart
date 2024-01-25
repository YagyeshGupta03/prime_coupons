import 'package:clipeate_project/controllers/product_controller.dart';
import 'package:clipeate_project/screens/category/category_wise_products.dart';
import 'package:clipeate_project/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/common_controllers.dart';
import '../../generated/l10n.dart';
import '../../helper/api_urls.dart';
import '../../widgets/constants.dart';
import '../../widgets/widgets.dart';
import '../category/categories_screen.dart';
import 'home_screen.dart';

class AllDeals extends StatefulWidget {
  const AllDeals({super.key});

  @override
  State<AllDeals> createState() => _AllDealsState();
}

class _AllDealsState extends State<AllDeals> {
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 50;


  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getAllDeals('0', '50', true);
    Get.find<FirebaseController>().fetchTopCategories();
  }

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
          MenuButton(
              home: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: HomeScreen())));
              },
              allDeals: () {},
              trending: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Trending())));
              },
              upcoming: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Upcoming())));
              },
              under10: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Under10())));
              }),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              offset = offset + 50;
              Get.find<ProductController>()
                  .getAllDeals('$offset', '$limit', false);
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                    S
                        .of(context)
                        .welcomeToPrimeCouponsAmazonCouponsAndDiscounts,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(.2)),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSlider(),
                    const SizedBox(height: 20),
                    Text(S.of(context).topCategories,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    GetBuilder<FirebaseController>(
                      builder: (FirebaseController controller) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            mainAxisExtent: 45,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (controller
                                        .topCategoriesList[index].catEnglish
                                        .toString() !=
                                    '') {
                                  Get.find<CategoryController>()
                                      .categoryProductList!
                                      .clear();
                                  Get.find<CategoryController>()
                                      .getCategoryProducts(
                                          Intl.getCurrentLocale() == 'en'
                                              ? controller
                                                  .topCategoriesList[index]
                                                  .catEnglish
                                                  .toString()
                                              : controller
                                                  .topCategoriesList[index]
                                                  .catSpanish
                                                  .toString(),
                                          '0',
                                          '10');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashboardScreen(
                                        index: 1,
                                        catScreen: CategoryWiseProduct(
                                            category: Intl.getCurrentLocale() ==
                                                    'en'
                                                ? controller
                                                    .topCategoriesList[index]
                                                    .catEnglish
                                                    .toString()
                                                : controller
                                                    .topCategoriesList[index]
                                                    .catSpanish
                                                    .toString()),
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardScreen(
                                                  catScreen: CategoriesScreen(),
                                                  index: 1)));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    Intl.getCurrentLocale() == 'en' ?
                                    controller
                                        .topCategoriesList[index].titleEnglish
                                        .toString()
                                    : controller
                                        .topCategoriesList[index].titleSpanish
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).allDeals,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    GetBuilder<ProductController>(
                      initState: (_) {
                        Get.find<ProductController>().getCouponsCount();
                      },
                      builder: (ProductController controller) {
                        return Text(
                          '${S.of(context).totalCoupons}:  ${controller.couponsCount}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductController>(
                builder: (ProductController controller) {
                  if (controller.productList!.isNotEmpty) {
                    return Column(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.productList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScrollCard(
                                upcoming: false,
                                data: controller.productList![index]);
                          },
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            ShimmerCard(),
                            SizedBox(width: 10),
                            ShimmerCard(),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Column(
                      children: [
                        Row(
                          children: [
                            ShimmerCard(),
                            SizedBox(width: 10),
                            ShimmerCard(),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            ShimmerCard(),
                            SizedBox(width: 10),
                            ShimmerCard(),
                          ],
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
//
class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
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
          MenuButton(
            home: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DashboardScreen(newScreen: HomeScreen())));
            },
            allDeals: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DashboardScreen(newScreen: AllDeals())));
            },
            trending: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DashboardScreen(newScreen: Trending())));
            },
            upcoming: () {},
            under10: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DashboardScreen(newScreen: Under10())));
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
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                Get.find<ProductController>()
                    .getUpcomingDeals('$offset', '$limit', false);
              });
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                width: screenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSlider(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  S.of(context).upcoming,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductController>(
                builder: (ProductController controller) {
                  if (controller.upcomingDealsList!.isNotEmpty) {
                    return Column(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.upcomingDealsList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScrollCard(
                                upcoming: true,
                                data: controller.upcomingDealsList![index]);
                          },
                        ),
                        const SizedBox(height: 10),
                        controller.upcomingLoad
                            ? const Row(
                                children: [
                                  ShimmerCard(),
                                  SizedBox(width: 10),
                                  ShimmerCard(),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          S.of(context).noProductsFound,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.home,
    required this.allDeals,
    required this.trending,
    required this.upcoming,
    required this.under10,
  });

  final Function home;
  final Function allDeals;
  final Function trending;
  final Function upcoming;
  final Function under10;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: Colors.black),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: '1',
            onTap: () {
              home();
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
              allDeals();
            },
            child: Row(
              children: [
                Icon(Icons.handshake_outlined, color: AppUi().primaryColor),
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
              Get.find<ProductController>().getTrendingDeals('0', '10', true);
              trending();
            },
            child: Row(
              children: [
                Icon(Icons.stacked_line_chart, color: AppUi().primaryColor),
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
              Get.find<ProductController>().getUpcomingDeals('0', '30', true);
              upcoming();
            },
            child: Row(
              children: [
                Icon(Icons.watch_later_outlined, color: AppUi().primaryColor),
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
              Get.find<ProductController>().getUnderTenDeals('0', '30', true);
              under10();
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
    );
  }
}

//
//
//
//
class Under10 extends StatefulWidget {
  const Under10({super.key});

  @override
  State<Under10> createState() => _Under10State();
}

class _Under10State extends State<Under10> {
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
          MenuButton(
              home: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: HomeScreen())));
              },
              allDeals: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: AllDeals())));
              },
              trending: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Trending())));
              },
              upcoming: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Upcoming())));
              },
              under10: () {}),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              offset = offset + 10;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                Get.find<ProductController>()
                    .getUnderTenDeals('$offset', '$limit', false);
              });
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSlider(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  S.of(context).underTen,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductController>(
                initState: (_) {},
                builder: (ProductController controller) {
                  if (controller.underTenDeals!.isNotEmpty) {
                    return Column(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.underTenDeals!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScrollCard(
                                upcoming: false,
                                data: controller.underTenDeals![index]);
                          },
                        ),
                        const SizedBox(height: 10),
                        controller.underLoad
                            ? const Row(
                                children: [
                                  ShimmerCard(),
                                  SizedBox(width: 10),
                                  ShimmerCard(),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          S.of(context).noProductsFound,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
//
class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;
  bool noProduct = false;

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
          MenuButton(
              home: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: HomeScreen())));
              },
              allDeals: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: AllDeals())));
              },
              trending: () {},
              upcoming: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Upcoming())));
              },
              under10: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DashboardScreen(newScreen: Under10())));
              }),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              offset = offset + 10;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                Get.find<ProductController>()
                    .getTrendingDeals('$offset', '$limit', false);
              });
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CustomSlider()),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  S.of(context).trendingDeals,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductController>(
                builder: (ProductController controller) {
                  if (controller.trendingDealsList!.isNotEmpty) {
                    return Column(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.trendingDealsList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScrollCard(
                                upcoming: false,
                                data: controller.trendingDealsList![index]);
                          },
                        ),
                        const SizedBox(height: 10),
                        controller.trendingLoad
                            ? const Row(
                                children: [
                                  ShimmerCard(),
                                  SizedBox(width: 10),
                                  ShimmerCard(),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          S.of(context).noProductsFound,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
//
class Latest extends StatefulWidget {
  const Latest({super.key});

  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
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
          MenuButton(home: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen(newScreen: HomeScreen())));
          }, allDeals: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen(newScreen: AllDeals())));
          }, trending: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen(newScreen: Trending())));
          }, upcoming: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen(newScreen: Upcoming())));
          }, under10: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DashboardScreen(newScreen: Under10())));
          }),
        ],
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              offset = offset + 10;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                Get.find<ProductController>()
                    .getLatestDeals('$offset', '$limit', false);
              });
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSlider(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  S.of(context).latestDeals,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductController>(
                initState: (_) {
                  Get.find<ProductController>().getLatestDeals('0', '10', true);
                },
                builder: (ProductController controller) {
                  if (controller.latestDealsList!.isNotEmpty) {
                    return Column(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.latestDealsList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScrollCard(
                                upcoming: false,
                                data: controller.latestDealsList![index]);
                          },
                        ),
                        const SizedBox(height: 10),
                        controller.latestLoad
                            ? const Row(
                                children: [
                                  ShimmerCard(),
                                  SizedBox(width: 10),
                                  ShimmerCard(),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: Text(
                          S.of(context).noProductsFound,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
