import 'package:analyst_coin/constants.dart';
import 'package:analyst_coin/utils/app_theme.dart';
import 'package:flutter/material.dart';
//translate
import 'package:analyst_coin/localization/keys.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OptionsUserButton extends StatelessWidget {
  OptionsUserButton(this.onTap);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      onTap: () {},
      iconSize: 0.0,
      style: TextStyle(color: kPrimaryColor),
      focusColor: kTertiaryColor,
      underline: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              IconData(58723, fontFamily: 'MaterialIcons'),
              size: 45.0,
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(translate(Keys.coins_screen_option_button) + ",",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 2.0,
                ),
                Text('Ferluigi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
      dropdownColor: Colors.white,
      onChanged: (newValue) {},
      items: <String>[
        translate(Keys.coins_screen_option_1),
        translate(Keys.coins_screen_option_2),
        translate(Keys.coins_screen_option_3)
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () {},
          value: value,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white),
              width: 105.0,
              child: GestureDetector(
                onTap: () {
                  if (value == translate(Keys.coins_screen_option_2)) {
                    Navigator.pushNamed(context, '/Settings');
                  }
                },
                child: Text(
                  value,
                  style: TextStyle(color: kBlackColor),
                ),
              )),
        );
      }).toList(),
    );
  }
}
