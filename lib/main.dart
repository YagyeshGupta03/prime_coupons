import 'package:clipeate_project/controllers/category_controller.dart';
import 'package:clipeate_project/controllers/credential_controller.dart';
import 'package:clipeate_project/controllers/favorite_controller.dart';
import 'package:clipeate_project/controllers/product_controller.dart';
import 'package:clipeate_project/screens/authentication/login_screen.dart';
import 'package:clipeate_project/screens/dashboard/dashboard_screen.dart';
import 'package:clipeate_project/screens/dashboard/filter_screen.dart';
import 'package:clipeate_project/screens/dashboard/home_screen.dart';
import 'package:clipeate_project/screens/dashboard/products_list.dart';
import 'package:clipeate_project/screens/dashboard/search_screen.dart';
import 'package:clipeate_project/screens/setting/language_screen.dart';
import 'package:clipeate_project/screens/setting/settings_screen.dart';
import 'package:clipeate_project/screens/setting/terms_condtions.dart';
import 'package:clipeate_project/screens/splash_screen.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:clipeate_project/widgets/firebase-option.dart';
import 'package:clipeate_project/widgets/no_connection_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'controllers/common_controllers.dart';
import 'generated/l10n.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  tz.initializeTimeZones();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final LanguageController _languageController =
        Get.put(LanguageController());

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      title: 'Prime Coupons',
      initialBinding: BindingsBuilder(() {
        Get.put(CategoryController());
        Get.put(CredentialController());
        Get.put(ProductController());
        Get.put(FavoriteController());
        Get.put(SearchingController());
        Get.put(FilterController());
        Get.put(FirebaseController());
      }),
      theme: ThemeData(
        primaryColor: AppUi().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(_languageController.currentLanguage.toString()),
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/noConnection": (context) => const NoConnectionScreen(),
        "/login": (context) => const LoginScreen(),
        "/dashboard": (context) => const DashboardScreen(),
        "/home": (context) => const HomeScreen(),
        "/search": (context) => const SearchScreen(),
        "/filter": (context) => const FilterScreen(),
        "/upcoming": (context) => const Upcoming(),
        "/trending": (context) => const Trending(),
        "/latest": (context) => const Latest(),
        "/under10": (context) => const Under10(),
        "/allDeals": (context) => const AllDeals(),
        "/settings": (context) => const SettingScreen(),
        "/language": (context) => const LanguageScreen(),
        "/terms": (context) => const TermsAndConditions(),
        "/privacy": (context) => const PrivacyPolicy(),
        "/blog": (context) => const Blog(),
      },
    );
  }
}
