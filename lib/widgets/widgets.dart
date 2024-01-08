import 'package:clipeate_project/controllers/favorite_controller.dart';
import 'package:clipeate_project/screens/dashboard/product_details.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezone/timezone.dart';
import '../controllers/category_controller.dart';
import '../controllers/global_controllers.dart';
import '../generated/l10n.dart';
import '../helper/models/ProductModel.dart';
import 'package:timezone/data/latest.dart' as tz;

class CustomLongButton extends StatelessWidget {
  const CustomLongButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.txtColor,
      required this.btnColor,
      required this.prefix,
      this.image});

  final Function onTap;
  final String title;
  final String? image;
  final Color txtColor;
  final Color btnColor;
  final bool prefix;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: btnColor),
      child: SizedBox(
        width: double.infinity,
        child: prefix
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image.toString(), height: 30, width: 30),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: txtColor,
                      // fontFamily: fontFamily,
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: txtColor,
                    // fontFamily: fontFamily,
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
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {super.key,
      this.controller,
      this.onTap,
      required this.enabled,
      this.submit});

  final TextEditingController? controller;
  final Function? onTap;
  final Function? submit;
  final bool enabled;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap!();
      },
      child: TextFormField(
        controller: widget.controller,
        onFieldSubmitted: (val) {
          widget.submit!();
        },
        decoration: InputDecoration(
          hintText: S.of(context).searchPrimeCoupons,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black.withOpacity(.7))),
          hoverColor: Colors.transparent,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: AppUi().primaryColor)),
          focusColor: Colors.transparent,
          enabled: widget.enabled,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black.withOpacity(.7))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black.withOpacity(.7))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.black.withOpacity(.7))),
          contentPadding:
              const EdgeInsets.only(left: 15, right: 10, bottom: 0, top: 0),
        ),
      ),
    );
  }
}

//
//
//
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.cont,
    this.keyboard,
    this.enable,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController cont;
  final bool? enable;
  final String hintText;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
      controller: cont,
      keyboardType: keyboard,
      enabled: enable,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: hintText,
        fillColor: Colors.white,
        filled: true,
        labelStyle: const TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUi().primaryColor),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUi().primaryColor),
            borderRadius: BorderRadius.circular(10)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      ),
    );
  }
}

//
//
//
class ScrollCard extends StatefulWidget {
  const ScrollCard({
    super.key,
    required this.data,
    required this.upcoming,
  });

  final Data data;
  final bool upcoming;

  @override
  State<ScrollCard> createState() => _ScrollCardState();
}

class _ScrollCardState extends State<ScrollCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<CategoryController>().getRelatedProducts(
            Intl.getCurrentLocale() == 'en'
                ? widget.data.categoryEnglish.toString()
                : widget.data.category.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(data: widget.data)));
      },
      child: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Image.network(widget.data.imageURL.toString(),
                            fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                Intl.getCurrentLocale() == 'en'
                                    ? widget.data.englishShortProductDescription
                                        .toString()
                                    : widget.data.spanishText.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.data.stars.toString(),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 5),
                                IgnorePointer(
                                  ignoring: true,
                                  child: RatingBar(
                                    initialRating: double.parse(
                                        widget.data.stars.toString()),
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 20,
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
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '(${widget.data.reviews})',
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Colors.grey.withOpacity(.5)),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                convertToCurrency(widget.data.finalPrice)
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                convertToCurrency(widget.data.regularPrice)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black.withOpacity(.6)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child:
                                  Image.asset(ImageConst().availableAtAmazon),
                            ),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (FavoriteController controller) {
                              return InkWell(
                                  onTap: () {
                                    if (credentialController.userId == '') {
                                      login(context);
                                    } else {
                                      if (Intl.getCurrentLocale() == 'en') {
                                        controller.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data
                                                .englishShortProductDescription,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL);
                                      } else {
                                        controller.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data.spanishText,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL);
                                      }
                                    }
                                  },
                                  child: credentialController.userId == ''
                                      ? const Icon(Icons.favorite_border,
                                          color: Colors.red)
                                      : controller.getFavourite(
                                              widget.data.asin.toString())
                                          ? const Icon(Icons.favorite,
                                              color: Colors.red)
                                          : const Icon(Icons.favorite_border,
                                              color: Colors.red));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.only(left: 3, top: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        width: 135,
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Icon(Icons.watch_later_outlined,
                                    size: 18,
                                    color: Colors.black.withOpacity(.7)),
                                const SizedBox(width: 5),
                                Text(
                                  widget.data.priceDropDate.toString() == 'null'
                                      ? getTimeAfter(
                                          context,
                                          combinePromoDateTime(
                                              widget.data.promoStartDate
                                                  .toString(),
                                              widget.data.promoStartTime
                                                  .toString(),
                                              'en'))
                                      : getTimeAgo(
                                          context,
                                          combinePriceDateTime(
                                              widget.data.priceDropDate
                                                  .toString(),
                                              widget.data.priceDropTime
                                                  .toString())),
                                  style: const TextStyle(
                                      fontSize: 9.5, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(left: 3, top: 4),
                      color: Colors.black.withOpacity(.7),
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                              '- ${widget.data.discount.toString()} Off',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    ),
                  ],
                )
              ],
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
class SearchCard extends StatefulWidget {
  const SearchCard({super.key, required this.data, required this.onTap});

  final Data data;
  final Function onTap;

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<CategoryController>().getRelatedProducts(
            Intl.getCurrentLocale() == 'en'
                ? widget.data.categoryEnglish.toString()
                : widget.data.category.toString());
        widget.onTap();
      },
      child: Stack(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child:
                            // CachedNetworkImage(
                            //   imageUrl: widget.data.imageURL.toString(),
                            //   placeholder: (context, url) => CircularProgressIndicator(),
                            //   errorWidget: (context, url, error) => Icon(Icons.error),
                            // ),
                            Image.network(widget.data.imageURL.toString(),
                                fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                Intl.getCurrentLocale() == 'en'
                                    ? widget.data.englishShortProductDescription
                                        .toString()
                                    : widget.data.spanishText.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.data.stars.toString(),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 5),
                                IgnorePointer(
                                  ignoring: true,
                                  child: RatingBar(
                                    initialRating: double.parse(
                                        widget.data.stars.toString()),
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 20,
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
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '(${widget.data.reviews})',
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Divider(color: Colors.grey.withOpacity(.5)),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                convertToCurrency(widget.data.finalPrice)
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                convertToCurrency(widget.data.regularPrice)
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black.withOpacity(.6)),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child:
                                  Image.asset(ImageConst().availableAtAmazon),
                            ),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (FavoriteController controller) {
                              return InkWell(
                                  onTap: () {
                                    if (credentialController.userId == '') {
                                      login(context);
                                    } else {
                                      if (Intl.getCurrentLocale() == 'en') {
                                        controller.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data
                                                .englishShortProductDescription,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL);
                                      } else {
                                        controller.addToFav(
                                            context,
                                            widget.data.asin,
                                            widget.data.spanishText,
                                            widget.data.validDateModified,
                                            widget.data.discount,
                                            widget.data.regularPrice,
                                            widget.data.finalPrice,
                                            widget.data.imageURL);
                                      }
                                    }
                                  },
                                  child: credentialController.userId == ''
                                      ? const Icon(Icons.favorite_border,
                                          color: Colors.red)
                                      : controller.getFavourite(
                                              widget.data.asin.toString())
                                          ? const Icon(Icons.favorite,
                                              color: Colors.red)
                                          : const Icon(Icons.favorite_border,
                                              color: Colors.red));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.only(left: 3, top: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        width: 135,
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Icon(Icons.watch_later_outlined,
                                    size: 18,
                                    color: Colors.black.withOpacity(.7)),
                                const SizedBox(width: 5),
                                Text(
                                  widget.data.priceDropDate.toString() == 'null'
                                      ? getTimeAfter(
                                          context,
                                          combinePromoDateTime(
                                              widget.data.promoStartDate
                                                  .toString(),
                                              widget.data.promoStartTime
                                                  .toString(),
                                              'en'))
                                      : getTimeAgo(
                                          context,
                                          combinePriceDateTime(
                                              widget.data.priceDropDate
                                                  .toString(),
                                              widget.data.priceDropTime
                                                  .toString())),
                                  style: const TextStyle(
                                      fontSize: 9.5, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(left: 3, top: 4),
                      color: Colors.black.withOpacity(.7),
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                              '- ${widget.data.discount.toString()} Off',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    ),
                  ],
                )
              ],
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
class ShimmerCard extends StatefulWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          width: screenWidth(context) / 2.1,
          height: 350,
        ));
  }
}

//
//
//
DateTime combinePriceDateTime(String dateString, String timeString) {
  // Parse date string
  DateTime date = DateTime.parse(dateString);

  // Parse time string (without seconds)
  List<int> timeComponents =
      timeString.split(':').map((component) => int.parse(component)).toList();
  int hours = timeComponents.isNotEmpty ? timeComponents[0] : 0;
  int minutes = timeComponents.length > 1 ? timeComponents[1] : 0;
  int seconds = timeComponents.length > 2 ? timeComponents[2] : 0;

  // Combine date and time
  return DateTime(date.year, date.month, date.day, hours, minutes, seconds);
}

//
//
//
// DateTime combinePromoDateTime(String dateString, String timeString) {
//
//   // Parse date string in the format "MMM dd, yyyy"
//   DateTime date = DateFormat('MMM dd, yyyy').parse(dateString);
//
//   // Parse time string in the format "hh:mm a z"
//   DateTime time = DateFormat('hh:mm a z').parse(timeString);
//
//   // Combine date and time
//   print(DateTime(
//       date.year, date.month, date.day, time.hour, time.minute, time.second));
//   return DateTime(
//       date.year, date.month, date.day, time.hour, time.minute, time.second);
// }
//
//
//

DateTime combinePromoDateTime(
    String dateString, String timeString, String locale) {
  // Set the locale for date parsing
  var dateParser = DateFormat('MMM dd, yyyy', locale);

  // Parse date string in the specified locale
  DateTime date = dateParser.parse(dateString);

  // Set the locale for time parsing
  var timeParser = DateFormat('hh:mm a z', locale);

  // Parse time string in the specified locale
  DateTime time = timeParser.parse(timeString);

  // Combine date and time
  DateTime combinedDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
    time.second,
  );

  return combinedDateTime;
}

//
//
//
TZDateTime convertToServerTimeZone(DateTime dateTime, String timeZone) {
  tz.initializeTimeZones();
  var location = getLocation(timeZone);
  return TZDateTime(location, dateTime.year, dateTime.month, dateTime.day,
      dateTime.hour, dateTime.minute, dateTime.second);
}

//
//
//
String getTimeAgo(context, DateTime createdAt) {
  tz.initializeTimeZones();
  var detroit = getLocation("Atlantic/Canary");
  TZDateTime serverTime = TZDateTime.now(detroit);

  TZDateTime createdAtInServerTimeZone =
      convertToServerTimeZone(createdAt, "Atlantic/Canary");

  final difference = serverTime.toUtc().difference(createdAtInServerTimeZone);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds}s ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays}d ago';
  } else if (difference.inDays < 60) {
    return S.of(context).aMonthAgo;
  } else if (difference.inDays > 60) {
    return S.of(context).twoMonthsAgo;
  } else if (difference.inDays > 90) {
    return S.of(context).fewMonthsAgo;
  } else {
    return S.of(context).longTimeAgo;
  }
}

//
//
//
String getTimeAfter(context, DateTime createdAt) {

  tz.initializeTimeZones();
  var detroit = getLocation("Atlantic/Canary");
  TZDateTime serverTime = TZDateTime.now(detroit);

  TZDateTime createdAtInServerTimeZone =
  convertToServerTimeZone(createdAt, "Atlantic/Canary");

  final difference = serverTime.toUtc().difference(createdAtInServerTimeZone);


  if (difference.inSeconds < 60) {
    return 'After ${difference.inSeconds}s';
  } else if (difference.inMinutes < 60) {
    return 'After ${difference.inMinutes}m';
  } else if (difference.inHours < 24) {
    return 'After ${difference.inHours}h';
  } else if (difference.inDays < 30) {
    return 'After ${difference.inDays}d';
  } else if (difference.inDays < 60) {
    return S.of(context).afterAMonth;
  } else if (difference.inDays > 60) {
    return S.of(context).afterTwoMonths;
  } else if (difference.inDays > 90) {
    return S.of(context).afterFewMonths;
  } else {
    return S.of(context).afterLongTime;
  }
}

language() {
  if (credentialController.language == 'en') {
    return 'english';
  } else {
    return 'spanish';
  }
}
