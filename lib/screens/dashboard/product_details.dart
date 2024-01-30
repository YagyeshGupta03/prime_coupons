import 'package:carousel_slider/carousel_slider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:clipeate_project/controllers/category_controller.dart';
import 'package:clipeate_project/controllers/credential_controller.dart';
import 'package:clipeate_project/controllers/favorite_controller.dart';
import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:clipeate_project/helper/api_urls.dart';
import 'package:clipeate_project/screens/category/categories_screen.dart';
import 'package:clipeate_project/screens/dashboard/dashboard_screen.dart';
import 'package:clipeate_project/screens/favorites/favorite_screen.dart';
import 'package:clipeate_project/screens/setting/settings_screen.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../helper/models/ProductModel.dart';
import '../../widgets/constants.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlParser;

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.data});

  final Data data;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _current = 0;
  final CarouselController carouselController = CarouselController();
  Set<int> favoriteIndices = <int>{};
  List<String> cardData = List.generate(10, (index) => 'Card $index');

  Map<String, dynamic> data = {};

  text() {
    String productDetail = Intl.getCurrentLocale() == 'en'
        ? widget.data.englishProdDescriptionFull.toString()
        : widget.data.spanishProdDescriptionFull.toString();
    data.clear();
    dom.Document document = htmlParser.parse(productDetail);
    var aboutThisItemText =
        document.querySelector('.a-size-base-plus.a-text-bold')?.text;
    List listItems = document.querySelectorAll('.a-list-item');

    data.addAll({
      "title": "$aboutThisItemText",
      "item": listItems,
    });
    return "";
  }

  @override
  void initState() {
    super.initState();
    text();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.data.imageFullRes2.toString(),
      widget.data.imageFullRes3.toString(),
      widget.data.imageFullRes4.toString(),
      widget.data.imageFullRes5.toString(),
    ];

    List<String> filterNonNullImages(List<String?> images) {
      return images
          .where((image) =>
              image.toString() != 'null' &&
              image.toString() != '' &&
              image.toString().isNotEmpty)
          .cast<String>()
          .toList();
    }

    Future<void> share(link) async {
      await FlutterShare.share(
        title: 'Prime Coupons',
        text: 'Prime Coupons',
        linkUrl: link,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: CustomSearchBar(
          enabled: false,
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        actions: [
          InkWell(
              onTap: () async {
                final dynamicLinkParams = DynamicLinkParameters(
                  uriPrefix: "https://primecoupons.page.link",
                  link: Uri.parse("$productDetailsUrl/${widget.data.asin}"),
                  androidParameters: const AndroidParameters(
                      packageName: "com.app.prime_coupons"),
                );
                final dynamicLink = await FirebaseDynamicLinks.instance
                    .buildLink(dynamicLinkParams);
                share(dynamicLink.toString());
              },
              child: const Icon(Icons.share, size: 25, color: Colors.black)),
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
                            builder: (context) => const DashboardScreen()));
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
                  value: '2',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen(
                                catScreen: CategoriesScreen(), index: 1)));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.category, color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).categories,
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
                                catScreen: FavoriteScreen(), index: 2)));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).favorites,
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
                    credentialController.userId == ''
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen(
                                    catScreen: SettingScreen(), index: 3)))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen(
                                    catScreen: SettingLogScreen(), index: 3)));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: AppUi().primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        S.of(context).settings,
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
            const SizedBox(height: 10),
            CarouselSlider(
              items: List.generate(
                  filterNonNullImages(images).length,
                  (index) => InkWell(
                        onTap: () {},
                        child: Container(
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.fill),
                            color: Colors.transparent,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 0),
                        ),
                      )),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  reverse: false,
                  aspectRatio: 1.1,
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
                  filterNonNullImages(images).asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 25.0 : 12.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : AppUi().primaryColor)
                            .withOpacity(_current == entry.key ? 1 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<CredentialController>(
                    builder: (CredentialController controller) {
                      return Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GetBuilder<FavoriteController>(
                            builder: (FavoriteController fController) {
                              return InkWell(
                                onTap: () {
                                  if (controller.userId == '') {
                                    login(context);
                                  } else {
                                    Intl.getCurrentLocale() == 'en'
                                        ? fController.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data
                                                .englishShortProductDescription,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL)
                                        : fController.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data.spanishText,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL);
                                  }
                                },
                                child: controller.userId == ''
                                    ? const Icon(Icons.favorite_border,
                                        color: Colors.red)
                                    : fController.getFavourite(
                                            widget.data.asin.toString())
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border,
                                            color: Colors.red),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined,
                          color: Colors.black, size: 15),
                      const SizedBox(width: 5),
                      Text(
                          widget.data.priceDropDate.toString() == 'null'
                              ? getTimeAfter(
                                  context,
                                  combinePromoDateTime(
                                      widget.data.promoStartDate.toString(),
                                      widget.data.promoStartTime.toString(),
                                      'en'))
                              : getTimeAgo(
                                  context,
                                  combinePriceDateTime(
                                      widget.data.priceDropDate.toString(),
                                      widget.data.priceDropTime.toString())),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(S.of(context).validUntil,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      const SizedBox(width: 5),
                      Text('${widget.data.validDateModified}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppUi().primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                      Intl.getCurrentLocale() == 'en'
                          ? widget.data.englishShortProductDescription
                              .toString()
                          : widget.data.spanishText.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.justify),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IgnorePointer(
                        child: RatingBar(
                          initialRating:
                              double.parse(widget.data.stars.toString()),
                          direction: Axis.horizontal,
                          itemSize: 24,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Color(0XFFFEAD1D),
                            ),
                            half: const Icon(Icons.star_half,
                                color: Color(0XFFFEAD1D)),
                            empty: const Icon(Icons.star_border,
                                color: Color(0XFFFEAD1D)),
                          ),
                          itemPadding: const EdgeInsets.only(right: 2),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      Text(
                        '${widget.data.stars.toString()} Ratings & ${widget.data.reviews.toString()} Reviews',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            '\$ ${widget.data.finalPrice}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppUi().primaryColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '\$ ${widget.data.regularPrice}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black.withOpacity(.6)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 7),
                      Card(
                        elevation: 0,
                        color: AppUi().filterClr,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '-${widget.data.discount} Off',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                      InkWell(
                        onTap: () {
                          if (Intl.getCurrentLocale() == 'en') {
                            _getCoupon(context, widget.data.promoCode,
                                widget.data.standardLinkEnglish);
                          } else {
                            _getCoupon(context, widget.data.promoCode,
                                widget.data.standardLinkSpanish);
                          }
                        },
                        // style: ElevatedButton.styleFrom(
                        //     elevation: 1,
                        //     backgroundColor: AppUi().primaryColor),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: AppUi().primaryColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  S.of(context).activateCoupon,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Card(
                      elevation: 0,
                      color: Colors.grey.withOpacity(.1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S
                                  .of(context)
                                  .descriptionAndPicturesOfProductAreForReferenceOnly,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                S
                                    .of(context)
                                    .pleaseVisitAmazonForCompleteDetails,
                                style: const TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(S.of(context).aboutThisItem,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data["item"]
                          .map<Widget>((e) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '⦿',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            decoration: TextDecoration.none,
                                            color: AppUi().primaryColor),
                                      ),
                                      const SizedBox(width: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SizedBox(
                                          width: screenWidth(context) - 45,
                                          child: Text(
                                            '${e.text}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.none,
                                                color: Colors.black
                                                    .withOpacity(.7)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10)
                                ],
                              ))
                          .toList(),
                    ),
                  ),

                  // SingleChildScrollView(
                  //   child: SizedBox(
                  //       height: 400,
                  //       child: WebViewWidget(controller: _controller)),
                  // ),
                  // RichText(
                  //   text: HTML.toTextSpan(
                  //     context,
                  //     productDetail,
                  //     defaultTextStyle: const TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.w500,
                  //         decoration: TextDecoration.none,
                  //         color: Colors.black),
                  //   ),
                  // ),
                  // Text(
                  //     widget.data.englishProdDescriptionFull
                  //         .toString()
                  //         .removeMarkdown()
                  //         .replaceAll('About this item', ''),
                  //     style: TextStyle(
                  //         fontSize: 13,
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.black.withOpacity(.7)),
                  //     textAlign: TextAlign.justify),
                  const SizedBox(height: 25),
                  Text(S.of(context).relatedProducts,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  GetBuilder<CategoryController>(
                    initState: (_) {},
                    builder: (CategoryController controller) {
                      return SizedBox(
                        height: 380,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.relatedProductList!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 195,
                              child: SearchCard(
                                  data: controller.relatedProductList![index],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreen(
                                                    data: controller
                                                            .relatedProductList![
                                                        index])));
                                  }),
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
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
//
void _getCoupon(BuildContext context, couponCode, amazonLink) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: Text(S.of(context).congrats,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red)),
        ),
        content: SizedBox(
          height: 420,
          child: Column(
            children: [
              Text(
                S.of(context).couponCodeActivated,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Text(
                S.of(context).willSaveYouApprox5074OnThisPurchase,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppUi().primaryColor, width: 1.5),
                    color: AppUi().primaryLightClr),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      S.of(context).goDirectToCheckout,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      S.of(context).codeWillBePlacedAutomatically,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          couponCode,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppUi().primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S
                          .of(context)
                          .couponAndAvailableQuantitiesAreDirectlyManagedByAmazon,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FlutterClipboard.copy(couponCode).then(
                              (value) => launchUrl(Uri.parse(amazonLink)));
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text('Buy Now')),
                    const SizedBox(height: 20),
                    Text(
                      S
                          .of(context)
                          .affiliateDisclosureAsAnAmazonAssociateWeMayEarnCommissions,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

//
//
//
void login(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        title: Center(
          child: Column(
            children: [
              Text(S.of(context).addToFavorites,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const Divider(),
            ],
          ),
        ),
        content: GetBuilder<FavoriteController>(
          builder: (FavoriteController controller) {
            return SizedBox(
              height: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(S.of(context).signInToCreateYourFavoriteList,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/login');
                  //   },
                  //   child: Card(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     color: AppUi().primaryColor,
                  //     child: Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: AppUi().primaryColor),
                  //       child: const Center(
                  //         child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      controller.signInWithFacebook(context);
                    },
                    child: Card(
                      color: Colors.blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: controller.loading
                            ? Center(
                            child: CircularProgressIndicator(
                                color: AppUi().primaryColor))
                            : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ImageConst().facebook,
                                height: 30, width: 30),
                            const SizedBox(width: 20),
                            Text(
                              S.of(context).signInWithFacebook,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                // fontFamily: fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      controller.signInWithGoogleWithFav(context);
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: controller.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: AppUi().primaryColor))
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(ImageConst().google,
                                      height: 30, width: 30),
                                  const SizedBox(width: 20),
                                  Text(
                                    S.of(context).signInWithGoogle,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      // fontFamily: fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              S.of(context).cancel,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
