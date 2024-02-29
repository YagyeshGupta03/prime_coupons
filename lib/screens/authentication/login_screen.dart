import 'package:clipeate_project/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favorite_controller.dart';
import '../../generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUi().primaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<FavoriteController>(
          builder: (FavoriteController controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(ImageConst().logo, fit: BoxFit.fill),
                ),
                const SizedBox(height: 70),
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
                      child:  controller.loading
                          ? const Center(
                          child: CircularProgressIndicator(
                              color: Colors.white))
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
                    controller.signInWithGoogle(context);
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
