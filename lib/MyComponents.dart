import 'package:flutter/material.dart';

enum ThemeColr {
  primary,
  secondary,
  hilightPrimary,
  hilightSecondary,
  }

Color getColor(enumthemeColr) {
    switch (enumthemeColr) {
      case ThemeColr.primary: {
        return Color.fromRGBO(255, 255, 255, 1);
      }
      case ThemeColr.secondary: {
        return Color.fromRGBO(19, 19, 20, 1);
      }
      case ThemeColr.hilightPrimary: {
        return Color.fromRGBO(235, 235, 233, 0.2);
      }
      case ThemeColr.hilightSecondary: {
        return Color.fromRGBO(121, 121, 121, 0.2);
      }
      default: {
        return Color.fromRGBO(255, 255, 255, 1);
      }
    }
}

Icon changeView(crs) {
    if (crs = true) {
      return Icon(Icons.apps);
    } else {
      return Icon(Icons.width_full_outlined);
    }
  }