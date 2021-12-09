import 'package:flutter/material.dart';
import 'package:analyst_coin/constants.dart';
//Components
import 'package:analyst_coin/components/Button.dart';
import 'package:analyst_coin/components/Loading_alert.dart';
// Firebase && and shared preferences
import 'package:firebase_auth/firebase_auth.dart';
import 'package:analyst_coin/services/shared_preferences.dart';
//redux
import 'package:analyst_coin/Redux/action_state.dart';
import 'package:analyst_coin/Redux/app_state.dart';
import 'package:analyst_coin/Redux/store.dart';

class Register extends StatefulWidget {
  static String id = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  BuildContext dialogContext;
  String firstName, lastName, userName, email, password, rtPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        padding:
            EdgeInsets.only(top: 80.0, bottom: 10.0, left: 15.0, right: 15.0),
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: kBoxColor.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                      decoration:
                          kInputStylePrimary.copyWith(labelText: 'First Name'),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                      decoration:
                          kInputStylePrimary.copyWith(labelText: 'Last Name'),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          userName = value;
                        });
                      },
                      decoration:
                          kInputStylePrimary.copyWith(labelText: 'UserName'),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration:
                          kInputStylePrimary.copyWith(labelText: 'Email'),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration:
                          kInputStylePrimary.copyWith(labelText: 'Password'),
                    ),
                    kSpace,
                    TextField(
                      autofocus: false,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          rtPassword = value;
                        });
                      },
                      decoration: kInputStylePrimary.copyWith(
                          labelText: 'Repeat Password'),
                    ),
                    kSpace,
                    Button(
                      btnColor: kPrimaryColor,
                      btnTitle: 'Register',
                      onPressed: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              dialogContext = context;
                              return ModalLoading();
                            });
                        //password verification
                        if (rtPassword == password) {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              //user token
                              String token = _auth.currentUser.uid;
                              SharedPreferenceService().setToken(token);
                              Redux.store.dispatch(SetCoinsStateAction(
                                  AppDataState(currentUser: token)));

                              Navigator.pop(dialogContext);
                              Navigator.pushNamed(context, '/coinScreen');
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else
                          print('ERROR PASSWORD');
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
