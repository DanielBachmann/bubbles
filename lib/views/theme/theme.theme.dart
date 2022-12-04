import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiadicThemeMaterial {
  static const borderRadius = 5.0;

  static ThemeData get theme => ThemeData(
      primarySwatch: diadicColor,
      textTheme: GoogleFonts.mavenProTextTheme(),
      backgroundColor: Colors.white,
      canvasColor: Colors.white);

  static MaterialColor get diadicColor {
    const Map<int, Color> diadicSwatch = {
      50: Color.fromRGBO(31, 171, 191, .1),
      100: Color.fromRGBO(31, 171, 191, .2),
      200: Color.fromRGBO(31, 171, 191, .3),
      300: Color.fromRGBO(31, 171, 191, .4),
      400: Color.fromRGBO(31, 171, 191, .5),
      500: Color.fromRGBO(31, 171, 191, .6),
      600: Color.fromRGBO(31, 171, 191, .7),
      700: Color.fromRGBO(31, 171, 191, .8),
      800: Color.fromRGBO(31, 171, 191, .9),
      900: Color.fromRGBO(31, 171, 191, 1),
    };
    const MaterialColor diadicMaterialColor =
        MaterialColor(0xff1fabbf, diadicSwatch);
    return diadicMaterialColor;
  }

  static MaterialColor get diadicContrastColor {
    const Map<int, Color> diadicSwatch = {
      50: Color.fromRGBO(223, 240, 216, .1),
      100: Color.fromRGBO(223, 240, 216, .2),
      200: Color.fromRGBO(223, 240, 216, .3),
      300: Color.fromRGBO(223, 240, 216, .4),
      400: Color.fromRGBO(223, 240, 216, .5),
      500: Color.fromARGB(153, 240, 216, 7),
      600: Color.fromRGBO(223, 240, 216, .7),
      700: Color.fromRGBO(223, 240, 216, .8),
      800: Color.fromRGBO(223, 240, 216, .9),
      900: Color.fromRGBO(223, 240, 216, 1),
    };
    const MaterialColor diadicMaterialColor =
        MaterialColor(0xffdff0d8, diadicSwatch);
    return diadicMaterialColor;
  }

  static double get sidePaddingValue {
    return 15;
  }

  static double get messagePanelButtonSize {
    return 45;
  }

  static EdgeInsets get paddingSides {
    return EdgeInsets.fromLTRB(sidePaddingValue, 0, sidePaddingValue, 0);
  }

  // shape of all buttons / icons used in the speed dial
  static ShapeBorder get dialShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static double get bottomPaddingChat {
    return 10.0;
  }

  static double get rightPaddingMessagePanelButtons {
    return 10;
  }
}
