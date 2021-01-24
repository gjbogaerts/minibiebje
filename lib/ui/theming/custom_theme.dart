import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'paddings.dart';

class CustomTheme {
  static ThemeData get standardTheme {
    return ThemeData(
      primaryColor: CustomColors.darkBlue,
      accentColor: CustomColors.amber,
      primaryColorDark: CustomColors.darkBlue,
      primaryColorLight: CustomColors.lightGrey,
      dividerColor: CustomColors.darkGrey,
      textSelectionColor: CustomColors.amber,
      errorColor: CustomColors.red,
      fontFamily: 'Commissioner',
      cardTheme: CardTheme(
        elevation: Paddings.elevatorHeight,
        shadowColor: CustomColors.darkGrey,
        margin: const EdgeInsets.symmetric(vertical: Paddings.dividerHeight),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: CustomColors.lightGrey, width: 1.0),
          borderRadius: BorderRadius.circular(
            Paddings.standardRadius,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: CustomColors.lightGrey,
        labelStyle: TextStyle(
          color: CustomColors.graphite,
          fontSize: 16.0,
        ),
        // contentPadding: const EdgeInsets.only(top: Paddings.formFieldPadding),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      buttonBarTheme: ButtonBarThemeData(
          alignment: MainAxisAlignment.spaceBetween,
          buttonAlignedDropdown: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: CustomColors.darkBlue,
          primary: CustomColors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Paddings.standardRadius),
          ),
          minimumSize: Size(120, 50),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: CustomColors.darkBlue,
          side: BorderSide(color: CustomColors.darkBlue, width: 0.5),
          minimumSize: Size(120, 50),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 18, color: CustomColors.graphite),
        bodyText1: TextStyle(
          fontSize: 16,
          color: CustomColors.graphite,
        ),
      ),
    );
  }
}
