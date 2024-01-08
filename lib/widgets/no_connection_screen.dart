import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'constants.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Center(
              child: Text(
                S.of(context).noInternet,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
             const SizedBox(height: 5),
             Center(
              child: Text(
                S.of(context).checkYourInternetConnection,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                 credentialController.connectionChecking(context);
                },
                child:  Text(S.of(context).refresh, style: const TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}
