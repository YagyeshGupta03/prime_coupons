import 'package:clipeate_project/controllers/favorite_controller.dart';
import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:clipeate_project/controllers/product_controller.dart';
import 'package:clipeate_project/helper/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../../controllers/credential_controller.dart';
import '../../generated/l10n.dart';
import '../../helper/models/FavoriteModel.dart';
import '../../widgets/constants.dart';
import '../../widgets/widgets.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/home_screen.dart';
import '../dashboard/products_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              GetBuilder<CredentialController>(
                builder: (CredentialController controller) {
                  return controller.userId == ''
                      ? Row(
                          children: [
                            Text(S.of(context).toCreateYourFavoriteList,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(S.of(context).signInHere,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppUi().primaryColor)),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 5),
                          child: Text(
                            'Hi! ${credentialController.email}',
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        );
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  S.of(context).myFavoriteProducts,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Card(
                  elevation: 0,
                  color: Colors.grey.withOpacity(.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S
                          .of(context)
                          .couponsAndAvailableQuantitiesAreManagedDirectlyByAmazonUse,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<CredentialController>(
                builder: (CredentialController controller) {
                  if (controller.userId == '') {
                    return Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              S.of(context).noFavoritesAvailable,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ]),
                    );
                  } else {
                    return GetBuilder<FavoriteController>(
                      initState: (_) {
                        Get.find<FavoriteController>().getFavCoupons(true);
                      },
                      builder: (FavoriteController favController) {
                        if(favController.favLoad){
                          return const Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        else{
                          if (favController.favoriteList!.isNotEmpty) {
                            return ListView.builder(
                              itemCount: favController.favoriteList!.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCard(
                                  data: favController.favoriteList![index],
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 40),
                                    Text(
                                      S.of(context).noFavoritesAvailable,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ]),
                            );
                          }
                        }
                      },
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
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.data});

  final Data data;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ProductController>().getProductDetails(
            context, '$productDetailsUrl/${widget.data.productAsin}');
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.data.productImageUrl.toString()),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth(context) - 190,
                    child: Text(widget.data.productDescription.toString(),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.6)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.black, size: 18),
                      const SizedBox(width: 5),
                      Text(
                          '${S.of(context).validUntil} ${widget.data.offerExpiration.toString()}',
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth(context) - 190,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${widget.data.discountPrice.toString()}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$ ${widget.data.regularPrice.toString()}',
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(.5)),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 0,
                              color: AppUi().filterClr,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '${widget.data.discount.toString()} Off',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            GetBuilder<FavoriteController>(
                              builder: (FavoriteController controller) {
                                return InkWell(
                                    onTap: () {
                                      Dialogs.materialDialog(
                                          msg: S
                                              .of(context)
                                              .doYouWantToDeleteThisProductFromFavorites,
                                          title: S.of(context).delete,
                                          msgAlign: TextAlign.center,
                                          color: Colors.white,
                                          context: context,
                                          actions: [
                                            IconsButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              text: S.of(context).cancel,
                                              color: Colors.white,
                                              textStyle: const TextStyle(
                                                  color: Colors.red),
                                            ),
                                            IconsButton(
                                              onPressed: () {
                                                controller.addToFav(
                                                    context,
                                                    widget.data.productAsin,
                                                    widget.data
                                                        .productDescription,
                                                    widget.data.offerExpiration,
                                                    widget.data.discount,
                                                    widget.data.regularPrice,
                                                    widget.data.discountPrice,
                                                    widget
                                                        .data.productImageUrl);
                                                Navigator.pop(context);
                                              },
                                              text: S.of(context).delete,
                                              color: Colors.red,
                                              textStyle: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ]);
                                    },
                                    child: const Icon(Icons.delete));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
