import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
//firebase && and shared preferences
import 'package:firebase_auth/firebase_auth.dart';
import 'package:analyst_coin/services/shared_preferences.dart';
//components
import 'package:analyst_coin/components/Button.dart';
import 'package:analyst_coin/components/Loading_alert.dart';

//redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/store.dart';

class Login extends StatefulWidget {
  static String id = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  BuildContext dialogContext;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding: EdgeInsets.only(top: 90.0),
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset(
                'assets/logo.gif',
                height: 210.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: kBoxColor.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600),
                  ),
                  kSpace,
                  TextField(
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kInputStyleWhite.copyWith(labelText: 'Email'),
                  ),
                  kSpace,
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kInputStyleWhite.copyWith(labelText: 'Password'),
                  ),
                  kSpace,
                  Button(
                    btnColor: Colors.white,
                    btnTitle: 'Login',
                    onPressed: () async {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            dialogContext = context;
                            return ModalLoading();
                          });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (user != null) {
                          //token user
                          String token = _auth.currentUser.uid;

                          SharedPreferenceService().setToken(token);
                          Redux.store.dispatch(SetCoinsStateAction(
                              AppDataState(currentUser: token)));

                          Navigator.pushNamed(context, '/coinScreen');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
