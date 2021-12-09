import 'package:flutter/material.dart';
//screen
import 'package:analyst_coin/screens/Chart_screen.dart';
import 'package:analyst_coin/screens/charts/CompleteChart_screen.dart';
import 'package:analyst_coin/screens/Home_screen.dart';
import 'package:analyst_coin/screens/Settings_screen.dart';
import 'package:analyst_coin/screens/coins_screen.dart';
import 'package:analyst_coin/screens/login&register/Login_screen.dart';
import 'package:analyst_coin/screens/login&register/Register_screen.dart';
//redux
import 'package:analyst_coin/Redux/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
//Translate
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
//Fonts
import 'package:google_fonts/google_fonts.dart';

class AnalystCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    var localizationDelegate = LocalizedApp.of(context).delegate;
    //StoreProvider.of<AppState>(context).dispatch(delegate);
    return StoreProvider<AppState>(
      store: Redux.store,
      child: LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: MaterialApp(
          title: 'AnalystCoin',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          theme: new ThemeData(
            textTheme: GoogleFonts.latoTextTheme(textTheme),
          ),
          initialRoute: Home.id,
          routes: {
            Login.id: (context) => Login(),
            Register.id: (context) => Register(),
            Home.id: (context) => Home(),
            CoinsScreen.id: (context) => CoinsScreen(),
            ChartScreen.id: (context) => ChartScreen(),
            CompleteChartScreen.id: (context) => CompleteChartScreen(),
            //Profile screen
            ScreenSettings.id: (context) => ScreenSettings(),
          },
        ),
      ),
    );
  }
}
