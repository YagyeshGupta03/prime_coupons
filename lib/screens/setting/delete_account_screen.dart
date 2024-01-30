import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:clipeate_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import '../../controllers/credential_controller.dart';
import '../../generated/l10n.dart';
import '../../widgets/constants.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppUi().primaryColor)),
        title: Text(
          S.of(context).selectLanguage,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              S.of(context).deleteAccount,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            const SizedBox(height: 20),
             Text(
              S.of(context).areYouSureToDeleteYourAccountOnceAnAccount,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
             Text(
              S.of(context).accountInfo,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            const SizedBox(height: 10),
            Text(
              credentialController.email.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            CustomLongButton(
                onTap: () {
                  Dialogs.materialDialog(
                      msg: S.of(context).doYouWantToDeleteYourAccount,
                      title: S.of(context).delete,
                      msgStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      titleStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),
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
                                // await controller.setUserInfo('', '');
                                Navigator.pop(context);
                                // await Navigator.pushNamed(
                                //     context, '/dashboard');
                                // Fluttertoast.showToast(
                                //     msg:
                                //     S.of(context).signedOutSuccessfully,
                                //     gravity: ToastGravity.SNACKBAR,
                                //     backgroundColor: Colors.green);
                              },
                              text: 'Delete',
                              color: Colors.red.shade700,
                              textStyle:
                              const TextStyle(color: Colors.white),
                            );
                          },
                        )
                      ]);
                },
                title: 'Delete Account',
                txtColor: Colors.white,
                btnColor: Colors.red,
                prefix: false)
          ],
        ),
      ),
    );
  }
}
