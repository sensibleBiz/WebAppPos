// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;
  Color customColor1;
  Color customColor2;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize];
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF001518);
  Color secondaryColor = const Color(0xFF052B45);
  Color tertiaryColor = const Color(0xFF3B65A9);
  Color alternate = const Color(0xFFFFECD5);
  Color primaryBackground = const Color(0xFFFFFFFF);
  Color secondaryBackground = const Color(0xFFD6F0FF);
  Color primaryText = const Color(0xFF000133);
  Color secondaryText = const Color(0xFF425CA9);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFF9EB1CE);
  Color customColor1 = Color(0xFFFF3B5B);
  Color customColor2 = Color(0xFF000000);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lora';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  String get title2Family => 'Lora';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get title3Family => 'Lora';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get subtitle1Family => 'Lora';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
  String get subtitle2Family => 'Lora';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
  String get bodyText1Family => 'Lora';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 11,
      );
  String get bodyText2Family => 'Lora';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 11,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lora';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  String get title2Family => 'Lora';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 21,
      );
  String get title3Family => 'Lora';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 21,
      );
  String get subtitle1Family => 'Lora';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get subtitle2Family => 'Lora';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Lora';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Lora';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lora';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  String get title2Family => 'Lora';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 21,
      );
  String get title3Family => 'Lora';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 21,
      );
  String get subtitle1Family => 'Lora';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get subtitle2Family => 'Lora';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Lora';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lora',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Lora';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lora',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF000C18);
  Color secondaryColor = const Color(0xFF052B45);
  Color tertiaryColor = const Color(0xFF3B65A9);
  Color alternate = const Color(0xFF042240);
  Color primaryBackground = const Color(0xFF000C18);
  Color secondaryBackground = const Color(0xFF042240);
  Color primaryText = const Color(0xFFFFFFFF);
  Color secondaryText = const Color(0xFF6C8FF8);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFF3B65A9);
  Color customColor1 = Color(0xFFFF3B5B);
  Color customColor2 = Color(0xFFFFFFFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
