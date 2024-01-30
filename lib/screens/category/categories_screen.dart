import 'package:clipeate_project/controllers/category_controller.dart';
import 'package:clipeate_project/helper/models/CategoryModel.dart';
import 'package:clipeate_project/screens/category/category_wise_products.dart';
import 'package:clipeate_project/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../generated/l10n.dart';
import '../../widgets/constants.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(S.of(context).categories,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
          ),
          Expanded(
            child: GetBuilder<CategoryController>(
              initState: (_) {
                Get.find<CategoryController>().getCategories();
              },
              builder: (CategoryController controller) {
                if (controller.categoryList!.isNotEmpty) {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      mainAxisExtent: 170,
                    ),
                    itemCount: controller.categoryList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryCard(
                          baseUrl: controller.baseUrl,
                          data: controller.categoryList![index]);
                    },
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                          color: AppUi().primaryColor));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//
//
//
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.data,
    required this.baseUrl,
  });

  final Data data;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<CategoryController>().categoryProductList!.clear();
        Get.find<CategoryController>().getCategoryProducts(
            Intl.getCurrentLocale() == 'en'
                ? data.englishText.toString()
                : data.spanishText.toString(),
            '0',
            '10');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              index: 1,
              catScreen: CategoryWiseProduct(
                  category: Intl.getCurrentLocale() == 'en'
                      ? data.englishText.toString()
                      : data.spanishText.toString()),
            ),
          ),
        );
      },
      child: GridTile(
        child: Card(
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network('$baseUrl${data.icons.toString()}',
                      fit: BoxFit.fill),
                ),
                const SizedBox(height: 10),
                Text(
                  Intl.getCurrentLocale() == 'en'
                      ? data.englishText.toString()
                      : data.spanishText.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
//
//
// class CategoryWiseProducts extends StatefulWidget {
//   const CategoryWiseProducts({super.key});
//
//   @override
//   State<CategoryWiseProducts> createState() => _CategoryWiseProductsState();
// }
//
// class _CategoryWiseProductsState extends State<CategoryWiseProducts> {
//   ScrollController scrollController = ScrollController();
//   int offset = 0;
//   int limit = 6;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, '/filter');
//           },
//           child: Container(
//             height: 10,
//             width: 10,
//             color: Colors.transparent,
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//             child: Image.asset(IconConst().filter,
//                 height: 10, width: 10, fit: BoxFit.fill),
//           ),
//         ),
//         title: CustomSearchBar(
//           enabled: false,
//           onTap: () {
//             Navigator.pushNamed(context, '/search');
//           },
//         ),
//         centerTitle: true,
//         actions: [
//           PopupMenuButton<String>(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             itemBuilder: (BuildContext context) {
//               return <PopupMenuEntry<String>>[
//                 PopupMenuItem<String>(
//                   value: '1',
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const DashboardScreen(newScreen: HomeScreen())));
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.home_outlined,
//                           color: AppUi().primaryColor),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'Home',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem<String>(
//                   value: '2',
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const DashboardScreen(newScreen: AllDeals())));
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.handshake_outlined,
//                           color: AppUi().primaryColor),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'All Deals',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem<String>(
//                   value: '3',
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const DashboardScreen(newScreen: Upcoming())));
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.watch_later_outlined,
//                           color: AppUi().primaryColor),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'Upcoming',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem<String>(
//                   value: '3',
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                             const DashboardScreen(newScreen: Under10())));
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.monetization_on_outlined,
//                           color: AppUi().primaryColor),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'Under \$ 10',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 PopupMenuItem<String>(
//                   value: '4',
//                   onTap: () async {
//                     if (!await launchUrl(Uri.parse(blogLink))) {
//                       throw Exception('Could not launch $blogLink');
//                     }
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.info,
//                           color: AppUi().primaryColor),
//                       const SizedBox(width: 10),
//                       const Text(
//                         'Blog',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               ];
//             },
//           ),
//         ],
//       ),
//       body: NotificationListener(
//         onNotification: (notification) {
//           if (notification is ScrollEndNotification) {
//             if (scrollController.position.pixels ==
//                 scrollController.position.maxScrollExtent) {
//               offset = offset + 6;
//               Future.delayed(const Duration(milliseconds: 500)).then((value) {
//                 Get.find<ProductController>()
//                     .getLatestDeals('$offset', '$limit');
//               });
//             }
//           }
//           return false;
//         },
//         child: SingleChildScrollView(
//           controller: scrollController,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: const CustomSlider(),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Text(
//                   S.of(context).latestDeals,
//                   style: const TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GetBuilder<ProductController>(
//                 initState: (_) {
//                   Get.find<ProductController>().getLatestDeals('0', '6');
//                 },
//                 builder: (ProductController controller) {
//                   if (controller.latestDealsList!.isNotEmpty) {
//                     return Column(
//                       children: [
//                         GridView.builder(
//                           gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: 350,
//                             mainAxisSpacing: 10.0,
//                           ),
//                           shrinkWrap: true,
//                           padding: const EdgeInsets.all(0),
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: controller.latestDealsList!.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return ScrollCard(
//                                 data: controller.latestDealsList![index]);
//                           },
//                         ),
//                         const SizedBox(height: 10),
//                         const Row(
//                           children: [
//                             ShimmerCard(),
//                             SizedBox(width: 10),
//                             ShimmerCard(),
//                           ],
//                         ),
//                       ],
//                     );
//                   } else {
//                     return const Column(
//                       children: [
//                         Row(
//                           children: [
//                             ShimmerCard(),
//                             SizedBox(width: 10),
//                             ShimmerCard(),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           children: [
//                             ShimmerCard(),
//                             SizedBox(width: 10),
//                             ShimmerCard(),
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
