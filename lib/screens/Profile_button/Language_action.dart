import 'package:analyst_coin/utils/app_theme.dart';
import 'package:analyst_coin/utils/screen.dart';
import 'package:flutter/material.dart';
//screen
import 'package:analyst_coin/screens/Settings_screen.dart';
//shared Preferences
import 'package:analyst_coin/services/shared_preferences.dart';
//translate
import 'package:analyst_coin/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LanguageButton {
  BuildContext dialogContext;

  void showActionSheet(BuildContext context) {
    //size screen
    final Function wd = Screen(context).wp;
    final Function hg = Screen(context).hp;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          dialogContext = context;
          return AlertDialog(
            backgroundColor: Colors.white,
            actionsPadding: EdgeInsets.all(00.0),
            actions: [
              OptionButton(
                  text: translate(Keys.Language_Name_En),
                  onTap: () {
                    changeLocale(context, 'en');
                    SharedPreferenceService().setLanguage('en');
                    Navigator.pop(context);
                  }),
              OptionButton(
                  text: translate(Keys.Language_Name_Es),
                  onTap: () {
                    changeLocale(context, 'es');
                    SharedPreferenceService().setLanguage('es');
                    Navigator.pop(context);
                  }),
              OptionButton(
                  text: translate(Keys.Language_Name_Pt),
                  onTap: () {
                    changeLocale(context, 'pt');
                    SharedPreferenceService().setLanguage('pt');
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  getCurrentLanguageLocalizationKey(String code) {
    switch (code) {
      case "en":
      case "en":
        return Keys.Language_Name_En;
      case "es":
        return Keys.Language_Name_Es;
      case "pt":
        return Keys.Language_Name_Pt;
      default:
        return null;
    }
  }
}
