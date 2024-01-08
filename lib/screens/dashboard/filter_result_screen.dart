import 'package:clipeate_project/controllers/common_controllers.dart';
import 'package:clipeate_project/screens/dashboard/home_screen.dart';
import 'package:clipeate_project/screens/dashboard/product_details.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../helper/api_urls.dart';
import '../../widgets/constants.dart';
import 'dashboard_screen.dart';

class FilterResultScreen extends StatefulWidget {
  const FilterResultScreen(
      {super.key,
      required this.min,
      required this.max,
      required this.status,
      required this.category,
      required this.sorting,
      required this.minDis,
      required this.maxDis});

  final String min;
  final String max;
  final String status;
  final String category;
  final String sorting;
  final String minDis;
  final String maxDis;

  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  final _search = TextEditingController();
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      builder: (FilterController controller) {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Image.asset(IconConst().filter,
                    height: 10, width: 10, fit: BoxFit.fill),
              ),
            ),
            title: CustomSearchBar(
              enabled: false,
              controller: _search,
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
                          Icon(Icons.home_outlined,
                              color: AppUi().primaryColor),
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
                                builder: (context) => const DashboardScreen(
                                    newScreen: AllDeals())));
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
                                builder: (context) => const DashboardScreen(
                                    newScreen: Trending())));
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
                                builder: (context) => const DashboardScreen(
                                    newScreen: Upcoming())));
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
                                builder: (context) => const DashboardScreen(
                                    newScreen: Under10())));
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
          body: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                if (scrollController.position.pixels ==
                    scrollController.position.maxScrollExtent) {
                  offset = offset + 10;
                  controller.getFilteredResults(
                      widget.min,
                      widget.max,
                      widget.status,
                      widget.category,
                      widget.sorting,
                      widget.minDis,
                      widget.maxDis,
                      '$offset',
                      '$limit',
                      false,
                      false, true);
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
                    child: Text(S.of(context).filterResults,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  controller.loading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              ShimmerCard(),
                              SizedBox(width: 10),
                              ShimmerCard(),
                            ],
                          ),
                        )
                      : controller.filterList!.isNotEmpty
                          ? Column(
                            children: [
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 360,
                                    mainAxisSpacing: 10.0,
                                  ),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.filterList!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return SearchCard(
                                        data: controller.filterList![index],
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsScreen(
                                                          data: controller
                                                                  .filterList![
                                                              index])));
                                        });
                                  },
                                ),
                              if (controller.afterLoading)
                                const Row(
                                  children: [
                                    ShimmerCard(),
                                    SizedBox(width: 10),
                                    ShimmerCard(),
                                  ],
                                ),
                            ],
                          )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                child: Text(
                                  S.of(context).noResults,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
