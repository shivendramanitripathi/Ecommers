import 'package:ecommers/constants/app_constant.dart';
import 'package:ecommers/languages/languages_controller.dart';
import 'package:ecommers/models/LanguageModel.dart';
import 'package:flutter/material.dart';



class LanguageWidget extends StatelessWidget {
final LanguageModel languageModel;
final LocalizationController localizationController;
final int index;
const LanguageWidget({super.key, required this.languageModel, required this.localizationController,
required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectedIndex(index);
      },
      child: Container(
        padding:const EdgeInsets.all(7),
        child:
            Center(child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(languageModel.imageUrl, style: TextStyle(fontSize: 20)),
                    SizedBox(width: 8,),
                    Text(languageModel.languageName, style: TextStyle(fontSize: 20,
                        color:  localizationController.selectedIndex == index ? Colors.blue : Colors.black),),
                  ],
                ),
              ],
            ),),


      )
    );
  }
}
