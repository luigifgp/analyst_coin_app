import 'package:analyst_coin/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
//shared preferences
import 'package:analyst_coin/services/shared_preferences.dart';
//translate
import 'package:analyst_coin/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:analyst_coin/screens/Profile_button/Language_action.dart';
//redux
import 'package:analyst_coin/Redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ScreenSettings extends StatefulWidget {
  static String id = '/Settings';
  @override
  _ScreenSettingsState createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  bool isSwitched;
  BuildContext dialogContext;
  LanguageButton languageButton = LanguageButton();

  @override
  Widget build(BuildContext context) {
    //size screen
    final Function wd = Screen(context).wp;
    final Function hg = Screen(context).hp;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(translate(Keys.coins_screen_option_2)),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 35.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translate(Keys.settings_screen_option_1),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18.0, color: kBlackColor),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconData(
                          0xe50f,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: kBlackColor,
                      ),
                      StoreConnector<AppState, dynamic>(
                          distinct: true,
                          converter: (store) => store.state.appDtState.appTheme,
                          builder: (context, appTheme) {
                            return Switch(
                              value: appTheme,
                              onChanged: (value) {
                                setState(() {
                                  ///Theme switch
                                  SharedPreferenceService().setTheme(value);
                                  Navigator.pushNamed(context, '/');
                                });
                              },
                              inactiveThumbColor: kPrimaryColor,
                              activeTrackColor: kTertiaryColor,
                              activeColor: Colors.white,
                            );
                          }),
                      Icon(
                        IconData(
                          0xe8ad,
                          fontFamily: 'MaterialIcons',
                        ),
                        color: kBoxColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            OptionButton(
              text: translate(Keys.settings_screen_option_2),
              onTap: () => languageButton.showActionSheet(context),
            ),
            OptionButton(
              text: translate(Keys.settings_screen_option_3),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({this.text, this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    //size screen
    final Function wd = Screen(context).wp;
    final Function hg = Screen(context).hp;
    return FlatButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: kTertiaryColor, width: 1, style: BorderStyle.solid)),
      onPressed: onTap,
      focusColor: kTertiaryColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18.0, color: kBlackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Change Language
