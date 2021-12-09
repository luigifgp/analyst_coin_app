import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
//loading
import 'package:analyst_coin/components/Loading_normal.dart';
import 'package:analyst_coin/components/Loading_without_bg.dart';
//app bar
import 'package:analyst_coin/screens/coins/Screen_bar.dart';
//  screen
import 'package:analyst_coin/screens/coins/Coin_list.dart';
import 'package:analyst_coin/screens/coins/Search_buttons.dart';
import 'package:analyst_coin/screens/coins/Show_coin.dart';
//notification
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/store.dart';

//Translation
import 'package:flutter_translate/flutter_translate.dart';
import 'package:analyst_coin/localization/keys.dart';

class CoinsScreen extends StatefulWidget {
  static String id = '/coinScreen';
  @override
  _CoinsScreenState createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen>
    with SingleTickerProviderStateMixin {
/*   AnimationController controller;
  AnimationController controllerPt2;
   Animation animationHeightPt1;*/
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Function onTap;

  void initState() {
    super.initState();

    //screen animation
    /*   controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationHeightPt1 = Tween(begin: 0.0, end: 600.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
 */
    //api coin call
    Redux.store.dispatch(fetchCoinsAction2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: StoreConnector<AppState, dynamic>(
        distinct: true,
        converter: (store) => store.state.appDtState,
        builder: (context, appDtState) {
          if (appDtState.isLoading) {
            return Center(
              child: Container(
                  height: 800.0,
                  width: 400.0,
                  color: Colors.black.withOpacity(0.4),
                  child: LoadingWithoutBG()),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 2.0,
                  ),
                  child: ScreenBar(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  child: appDtState.coinTaken == null
                      ? Container()
                      : ShowCoin(coinTaken: appDtState.coinTaken),
                ),
                Expanded(
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBoxColor.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    // height: appDtState.coinTaken == null
                    //     ? animationHeightPt1.value
                    //     : 450.0,
                    child: StoreConnector<AppState, dynamic>(
                        distinct: true,
                        converter: (store) => store.state.appDtState,
                        builder: (context, appDtState) {
                          return Column(
                            children: <Widget>[
                              SearchButton(appDtState.coins[0].type),
                              appDtState.isLoading
                                  ? Center(child: NormalLoading())
                                  : Expanded(
                                      child: ListView(
                                        children: coinList(appDtState.coins),
                                      ),
                                    ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
