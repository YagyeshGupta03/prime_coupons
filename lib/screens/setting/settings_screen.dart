// ignore_for_file: use_build_context_synchronously

import 'package:clipeate_project/controllers/credential_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../helper/api_urls.dart';
import '../../widgets/constants.dart';
import '../../widgets/widgets.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/home_screen.dart';
import '../dashboard/products_list.dart';

class SettingLogScreen extends StatefulWidget {
  const SettingLogScreen({super.key});

  @override
  State<SettingLogScreen> createState() => _SettingLogScreenState();
}

class _SettingLogScreenState extends State<SettingLogScreen> {
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
                        builder: (context) => const DashboardScreen(
                            newScreen: HomeScreen())));
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
              under10: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const DashboardScreen(newScreen: Under10())));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SettingCard(
              icon: Icons.language,
              title: S.of(context).language,
              onTap: () {
                Navigator.pushNamed(context, '/language');
              },
            ),
            SettingCard(
              icon: Icons.info,
              title: S.of(context).blog,
              onTap: () async {
                if (!await launchUrl(Uri.parse(blogLink))) {
                  throw Exception('Could not launch $blogLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.privacy_tip_outlined,
              title: S.of(context).termsAndConditions,
              onTap: () async {
                if (!await launchUrl(Uri.parse(termsLink))) {
                throw Exception('Could not launch $termsLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.security,
              title: S.of(context).privacyPolicy,
              onTap: () async {
                if (!await launchUrl(Uri.parse(privacyLink))) {
                throw Exception('Could not launch $privacyLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.support_agent,
              title: S.of(context).contactUs,
              onTap: () async {
                if (!await launchUrl(Uri.parse(contactLink))) {
                  throw Exception('Could not launch $contactLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.logout,
              title: S.of(context).logout,
              onTap: () {
                Dialogs.materialDialog(
                    msg: S.of(context).doYouWantToLogout,
                    title: S.of(context).logout,
                    msgStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    titleStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
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
                        textStyle: TextStyle(color: AppUi().primaryColor),
                      ),
                      GetBuilder<CredentialController>(
                        builder: (CredentialController controller) {
                          return controller.loading
                              ? Card(
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppUi().primaryColor),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              : IconsButton(
                                  onPressed: () async {
                                    await controller.setUserInfo('', '');
                                    Navigator.pop(context);
                                    await Navigator.pushNamed(
                                        context, '/dashboard');
                                    Fluttertoast.showToast(
                                        msg: S.of(context).signedOutSuccessfully,
                                        gravity: ToastGravity.SNACKBAR,
                                        backgroundColor: Colors.green);
                                  },
                                  text: S.of(context).logout,
                                  color: AppUi().primaryColor,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                );
                        },
                      )
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                        builder: (context) => const DashboardScreen(
                            newScreen: HomeScreen())));
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
              under10: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const DashboardScreen(newScreen: Under10())));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SettingCard(
              icon: Icons.language,
              title: S.of(context).language,
              onTap: () {
                Navigator.pushNamed(context, '/language');
              },
            ),
            SettingCard(
              icon: Icons.info,
              title: S.of(context).blog,
              onTap: () async {
                if (!await launchUrl(Uri.parse(blogLink))) {
                  throw Exception('Could not launch $blogLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.privacy_tip_outlined,
              title: S.of(context).termsAndConditions,
              onTap: () async {
                if (!await launchUrl(Uri.parse(termsLink))) {
                throw Exception('Could not launch $termsLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.security,
              title: S.of(context).privacyPolicy,
              onTap: () async {
                if (!await launchUrl(Uri.parse(privacyLink))) {
                throw Exception('Could not launch $privacyLink');
                }
              },
            ),
            SettingCard(
              icon: Icons.support_agent,
              title: S.of(context).contactUs,
              onTap: () async {
                if (!await launchUrl(Uri.parse(contactLink))) {
                  throw Exception('Could not launch $contactLink');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatefulWidget {
  const SettingCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final Function onTap;

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Icon(widget.icon, color: AppUi().primaryColor),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
