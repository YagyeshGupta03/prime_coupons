import 'package:clipeate_project/controllers/common_controllers.dart';
import 'package:clipeate_project/screens/dashboard/home_screen.dart';
import 'package:clipeate_project/screens/dashboard/product_details.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import 'dashboard_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _search = TextEditingController();
  ScrollController scrollController = ScrollController();
  int offset = 0;
  int limit = 10;

  bool startSearching = false;

  @override
  void initState() {
    super.initState();
    Get.find<SearchingController>().searchList!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
      builder: (SearchingController controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black)),
            // leading: InkWell(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/filter');
            //   },
            //   child: Container(
            //     height: 10,
            //     width: 10,
            //     color: Colors.transparent,
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //     child: Image.asset(IconConst().filter,
            //         height: 10, width: 10, fit: BoxFit.fill),
            //   ),
            // ),
            title: CustomSearchBar(
              enabled: true,
              controller: _search,
              submit: () {
                startSearching = true;
                setState(() {});
                controller.getSearchResults(_search.text, '0', '10');
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
                  if (startSearching == true) {
                    controller.searchContinue(
                        _search.text, '$offset', '$limit');
                  }
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
                    child: Text(S.of(context).searchResults,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                  controller.searchList!.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 380,
                            mainAxisSpacing: 10.0,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SearchCard(
                                data: controller.searchList![index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                              data: controller
                                                  .searchList![index]),
                                    ),
                                  );
                                });
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              S.of(context).noSearchResults,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
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
