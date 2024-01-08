import 'package:clipeate_project/controllers/global_controllers.dart';
import 'package:clipeate_project/widgets/constants.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String language = credentialController.language == 'en' ? '0' : '1';

  List<String> languages = ['English', 'Spanish'];
  List<String> flags = [ImageConst().usFlag, ImageConst().spainFlag];

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
          children: [
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return LanguageCard(
                    image: flags[index],
                    language: language,
                    index: index,
                    title: languages[index],
                    onTap: () {
                      language = index.toString();
                      if(language == '0'){
                        credentialController.setLanguage('en');
                      } else if (language == '1') {
                        credentialController.setLanguage('es');
                      }
                      setState(() {});
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}



class LanguageCard extends StatelessWidget {
  const LanguageCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.language,
      required this.index});

  final String title;
  final String image;
  final Function onTap;
  final String language;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        color:
            language == index.toString() ? AppUi().primaryColor : Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(image, height: 40, width: 30),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:
                    language == index.toString() ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
