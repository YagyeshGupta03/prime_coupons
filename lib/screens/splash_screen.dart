//
import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../widgets/constants.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3)).then((value) {
//       Navigator.pushReplacementNamed(context, '/allDeals');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: screenWidth(context),
//             height: screenHeight(context),
//             color: AppUi().primaryColor,
//           ),
//           Center(
//             child: TweenAnimationBuilder(
//               tween: Tween<double>(begin: -800, end: 0),
//               // Start logo -200 pixels above the screen
//               duration: const Duration(seconds: 2),
//               // Same duration as animation controller
//               curve: Curves.elasticInOut,
//               // Same animation curve as the animation controller
//               builder: (context, double offset, child) {
//                 return Transform.translate(
//                   offset: Offset(0, offset),
//                   child: child,
//                 );
//               },
//               child: Image.asset(
//                 ImageConst().logo,
//                 fit: BoxFit.contain,
//                 height: 200, width: 300,
//                 scale: 3,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    credentialController.connectionChecking(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConst().splash),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 20),
            Text(S.of(context).primeCoupons,
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            const SizedBox(height: 15),
            Text(S.of(context).onlyAmazonCouponsAndDiscounts,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.5))),
          ],
        ),
      ),
    );
  }
}
