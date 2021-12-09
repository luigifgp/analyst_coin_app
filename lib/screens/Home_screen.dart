import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
//shared preferences
import 'package:analyst_coin/services/shared_preferences.dart';
import 'package:analyst_coin/localization/keys.dart';
//screen
import 'package:analyst_coin/screens/coins_screen.dart';
//component
import 'package:analyst_coin/components/Button.dart';
import 'package:flutter_translate/flutter_translate.dart';
//redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/store.dart';

class Home extends StatefulWidget {
  static String id = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    confirmation();
  }

  confirmation() async {
    SharedPreferenceService().getSharedPreferencesInstance();
    //USER TOKEN
    String token = await SharedPreferenceService().token();
    if (token != null) {
      //  Navigator.(context, '/coinScreen');
      Navigator.of(context).pushNamedAndRemoveUntil(
          CoinsScreen.id, (Route<dynamic> route) => false);
    }
    //USER LANGUAGE
    String language = await SharedPreferenceService().language();
    if (language != null) {
      changeLocale(context, language);

      //APP THEME
      bool theme = await SharedPreferenceService().theme();
      if (theme == null) {
        theme == false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.0), BlendMode.dstATop),
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                  tag: 'logo',
                  child: Container(child: Image.asset('assets/logo.gif'))),
              Text(
                'Analyst Coin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Button(
                btnColor: Colors.white,
                btnTitle: translate(Keys.Home_button_1),
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Button(
                btnColor: kPrimaryColor,
                btnTitle: translate(Keys.Home_button_2),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
