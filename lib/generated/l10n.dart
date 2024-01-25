// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Prime Coupons - Amazon Coupons and Discounts`
  String get welcomeToPrimeCouponsAmazonCouponsAndDiscounts {
    return Intl.message(
      'Welcome to Prime Coupons - Amazon Coupons and Discounts',
      name: 'welcomeToPrimeCouponsAmazonCouponsAndDiscounts',
      desc: '',
      args: [],
    );
  }

  /// `Latest Deals`
  String get latestDeals {
    return Intl.message(
      'Latest Deals',
      name: 'latestDeals',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Trending Deals`
  String get trendingDeals {
    return Intl.message(
      'Trending Deals',
      name: 'trendingDeals',
      desc: '',
      args: [],
    );
  }

  /// `Top Categories`
  String get topCategories {
    return Intl.message(
      'Top Categories',
      name: 'topCategories',
      desc: '',
      args: [],
    );
  }

  /// `Top Brands`
  String get topBrands {
    return Intl.message(
      'Top Brands',
      name: 'topBrands',
      desc: '',
      args: [],
    );
  }

  /// `How to use Amazon coupon codes`
  String get howToUseAmazonCouponCodes {
    return Intl.message(
      'How to use Amazon coupon codes',
      name: 'howToUseAmazonCouponCodes',
      desc: '',
      args: [],
    );
  }

  /// `Get A Prime Membership`
  String get getAPrimeMembership {
    return Intl.message(
      'Get A Prime Membership',
      name: 'getAPrimeMembership',
      desc: '',
      args: [],
    );
  }

  /// `For Free Shipping`
  String get forFreeShipping {
    return Intl.message(
      'For Free Shipping',
      name: 'forFreeShipping',
      desc: '',
      args: [],
    );
  }

  /// `Visit CLIPEATE.COM`
  String get visitClipeatecom {
    return Intl.message(
      'Visit CLIPEATE.COM',
      name: 'visitClipeatecom',
      desc: '',
      args: [],
    );
  }

  /// `Click Activate Coupon`
  String get clickActivateCoupon {
    return Intl.message(
      'Click Activate Coupon',
      name: 'clickActivateCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Discount`
  String get confirmYourDiscount {
    return Intl.message(
      'Confirm Your Discount',
      name: 'confirmYourDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Proceed With Checkout`
  String get proceedWithCheckout {
    return Intl.message(
      'Proceed With Checkout',
      name: 'proceedWithCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Deals`
  String get upcomingDeals {
    return Intl.message(
      'Upcoming Deals',
      name: 'upcomingDeals',
      desc: '',
      args: [],
    );
  }

  /// `Under $ 10`
  String get underTen {
    return Intl.message(
      'Under \$ 10',
      name: 'underTen',
      desc: '',
      args: [],
    );
  }

  /// `All Deals`
  String get allDeals {
    return Intl.message(
      'All Deals',
      name: 'allDeals',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Valid until`
  String get validUntil {
    return Intl.message(
      'Valid until',
      name: 'validUntil',
      desc: '',
      args: [],
    );
  }

  /// `Activate Coupon`
  String get activateCoupon {
    return Intl.message(
      'Activate Coupon',
      name: 'activateCoupon',
      desc: '',
      args: [],
    );
  }

  /// `This pictures of products are for reference only.`
  String get thisPicturesOfProductsAreForReferenceOnly {
    return Intl.message(
      'This pictures of products are for reference only.',
      name: 'thisPicturesOfProductsAreForReferenceOnly',
      desc: '',
      args: [],
    );
  }

  /// `Please visit amazon for complete details`
  String get pleaseVisitAmazonForCompleteDetails {
    return Intl.message(
      'Please visit amazon for complete details',
      name: 'pleaseVisitAmazonForCompleteDetails',
      desc: '',
      args: [],
    );
  }

  /// `Description And Pictures Of Product Are For Reference Only`
  String get descriptionAndPicturesOfProductAreForReferenceOnly {
    return Intl.message(
      'Description And Pictures Of Product Are For Reference Only',
      name: 'descriptionAndPicturesOfProductAreForReferenceOnly',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Under`
  String get under {
    return Intl.message(
      'Under',
      name: 'under',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `No products found`
  String get noProductsFound {
    return Intl.message(
      'No products found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: '',
      args: [],
    );
  }

  /// `Filter Results`
  String get filterResults {
    return Intl.message(
      'Filter Results',
      name: 'filterResults',
      desc: '',
      args: [],
    );
  }

  /// `No results`
  String get noResults {
    return Intl.message(
      'No results',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min {
    return Intl.message(
      'Min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Max`
  String get max {
    return Intl.message(
      'Max',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Instant Deals`
  String get instantDeals {
    return Intl.message(
      'Instant Deals',
      name: 'instantDeals',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `All Discounts`
  String get allDiscounts {
    return Intl.message(
      'All Discounts',
      name: 'allDiscounts',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Off and above`
  String get offAndAbove {
    return Intl.message(
      'Off and above',
      name: 'offAndAbove',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `All Category`
  String get allCategory {
    return Intl.message(
      'All Category',
      name: 'allCategory',
      desc: '',
      args: [],
    );
  }

  /// `Sorting`
  String get sorting {
    return Intl.message(
      'Sorting',
      name: 'sorting',
      desc: '',
      args: [],
    );
  }

  /// `Default Rank`
  String get defaultRank {
    return Intl.message(
      'Default Rank',
      name: 'defaultRank',
      desc: '',
      args: [],
    );
  }

  /// `Price: Low To High`
  String get priceLowToHigh {
    return Intl.message(
      'Price: Low To High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price: High To Low`
  String get priceHighToLow {
    return Intl.message(
      'Price: High To Low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Discount: High To Low`
  String get discountHighToLow {
    return Intl.message(
      'Discount: High To Low',
      name: 'discountHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newest {
    return Intl.message(
      'Newest',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `Visit PrimeCoupons.com`
  String get visitPrimecouponscom {
    return Intl.message(
      'Visit PrimeCoupons.com',
      name: 'visitPrimecouponscom',
      desc: '',
      args: [],
    );
  }

  /// `About this item`
  String get aboutThisItem {
    return Intl.message(
      'About this item',
      name: 'aboutThisItem',
      desc: '',
      args: [],
    );
  }

  /// `Related Products`
  String get relatedProducts {
    return Intl.message(
      'Related Products',
      name: 'relatedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get congrats {
    return Intl.message(
      'Congrats!',
      name: 'congrats',
      desc: '',
      args: [],
    );
  }

  /// `Coupon code activated`
  String get couponCodeActivated {
    return Intl.message(
      'Coupon code activated',
      name: 'couponCodeActivated',
      desc: '',
      args: [],
    );
  }

  /// `Will save you approx 50.74 on this purchase`
  String get willSaveYouApprox5074OnThisPurchase {
    return Intl.message(
      'Will save you approx 50.74 on this purchase',
      name: 'willSaveYouApprox5074OnThisPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Go direct to checkout`
  String get goDirectToCheckout {
    return Intl.message(
      'Go direct to checkout',
      name: 'goDirectToCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Code will be placed automatically`
  String get codeWillBePlacedAutomatically {
    return Intl.message(
      'Code will be placed automatically',
      name: 'codeWillBePlacedAutomatically',
      desc: '',
      args: [],
    );
  }

  /// `Coupon and available quantities are directly managed by amazon`
  String get couponAndAvailableQuantitiesAreDirectlyManagedByAmazon {
    return Intl.message(
      'Coupon and available quantities are directly managed by amazon',
      name: 'couponAndAvailableQuantitiesAreDirectlyManagedByAmazon',
      desc: '',
      args: [],
    );
  }

  /// `Affiliate Disclosure: As an amazon associate, we may earn commissions from qualifying purchases from amazon.com`
  String get affiliateDisclosureAsAnAmazonAssociateWeMayEarnCommissions {
    return Intl.message(
      'Affiliate Disclosure: As an amazon associate, we may earn commissions from qualifying purchases from amazon.com',
      name: 'affiliateDisclosureAsAnAmazonAssociateWeMayEarnCommissions',
      desc: '',
      args: [],
    );
  }

  /// `Add To Favorites?`
  String get addToFavorites {
    return Intl.message(
      'Add To Favorites?',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to Create Your Favorite List`
  String get signInToCreateYourFavoriteList {
    return Intl.message(
      'Sign in to Create Your Favorite List',
      name: 'signInToCreateYourFavoriteList',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get searchResults {
    return Intl.message(
      'Search Results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `No search results`
  String get noSearchResults {
    return Intl.message(
      'No search results',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `To create your favorite list`
  String get toCreateYourFavoriteList {
    return Intl.message(
      'To create your favorite list',
      name: 'toCreateYourFavoriteList',
      desc: '',
      args: [],
    );
  }

  /// `Sign in Here.`
  String get signInHere {
    return Intl.message(
      'Sign in Here.',
      name: 'signInHere',
      desc: '',
      args: [],
    );
  }

  /// `My favorite products`
  String get myFavoriteProducts {
    return Intl.message(
      'My favorite products',
      name: 'myFavoriteProducts',
      desc: '',
      args: [],
    );
  }

  /// `Coupons And Available Quantities Are Managed Directly By Amazon. Use Them As Soon As Possible.`
  String get couponsAndAvailableQuantitiesAreManagedDirectlyByAmazonUse {
    return Intl.message(
      'Coupons And Available Quantities Are Managed Directly By Amazon. Use Them As Soon As Possible.',
      name: 'couponsAndAvailableQuantitiesAreManagedDirectlyByAmazonUse',
      desc: '',
      args: [],
    );
  }

  /// `No Favorites Available`
  String get noFavoritesAvailable {
    return Intl.message(
      'No Favorites Available',
      name: 'noFavoritesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this product from favorites?`
  String get doYouWantToDeleteThisProductFromFavorites {
    return Intl.message(
      'Do you want to delete this product from favorites?',
      name: 'doYouWantToDeleteThisProductFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout?`
  String get doYouWantToLogout {
    return Intl.message(
      'Do you want to logout?',
      name: 'doYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Signed out successfully`
  String get signedOutSuccessfully {
    return Intl.message(
      'Signed out successfully',
      name: 'signedOutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Prime Coupons`
  String get primeCoupons {
    return Intl.message(
      'Prime Coupons',
      name: 'primeCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Only Amazon Coupons and Discounts`
  String get onlyAmazonCouponsAndDiscounts {
    return Intl.message(
      'Only Amazon Coupons and Discounts',
      name: 'onlyAmazonCouponsAndDiscounts',
      desc: '',
      args: [],
    );
  }

  /// `No Internet`
  String get noInternet {
    return Intl.message(
      'No Internet',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get checkYourInternetConnection {
    return Intl.message(
      'Check your internet connection',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Search Prime Coupons`
  String get searchPrimeCoupons {
    return Intl.message(
      'Search Prime Coupons',
      name: 'searchPrimeCoupons',
      desc: '',
      args: [],
    );
  }

  /// `A month ago`
  String get aMonthAgo {
    return Intl.message(
      'A month ago',
      name: 'aMonthAgo',
      desc: '',
      args: [],
    );
  }

  /// `Two months ago`
  String get twoMonthsAgo {
    return Intl.message(
      'Two months ago',
      name: 'twoMonthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `Few months ago`
  String get fewMonthsAgo {
    return Intl.message(
      'Few months ago',
      name: 'fewMonthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `Long time ago`
  String get longTimeAgo {
    return Intl.message(
      'Long time ago',
      name: 'longTimeAgo',
      desc: '',
      args: [],
    );
  }

  /// `After a month`
  String get afterAMonth {
    return Intl.message(
      'After a month',
      name: 'afterAMonth',
      desc: '',
      args: [],
    );
  }

  /// `After two months`
  String get afterTwoMonths {
    return Intl.message(
      'After two months',
      name: 'afterTwoMonths',
      desc: '',
      args: [],
    );
  }

  /// `After few months`
  String get afterFewMonths {
    return Intl.message(
      'After few months',
      name: 'afterFewMonths',
      desc: '',
      args: [],
    );
  }

  /// `After long time`
  String get afterLongTime {
    return Intl.message(
      'After long time',
      name: 'afterLongTime',
      desc: '',
      args: [],
    );
  }

  /// `Total Coupons`
  String get totalCoupons {
    return Intl.message(
      'Total Coupons',
      name: 'totalCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete your account? Once an account is deleted, it cannot be recovered again!`
  String get areYouSureToDeleteYourAccountOnceAnAccount {
    return Intl.message(
      'Are you sure to delete your account? Once an account is deleted, it cannot be recovered again!',
      name: 'areYouSureToDeleteYourAccountOnceAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account Info`
  String get accountInfo {
    return Intl.message(
      'Account Info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete your account?`
  String get doYouWantToDeleteYourAccount {
    return Intl.message(
      'Do you want to delete your account?',
      name: 'doYouWantToDeleteYourAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
