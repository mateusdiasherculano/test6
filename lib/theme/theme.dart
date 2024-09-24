import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyTheme {
  MyTheme({
    this.brightness,
    this.backgroundColor,
    this.scaffoldBackgroundColor,
    this.bottomAppBarColor,
    this.primaryColor,
    this.primaryColorBrightness,
    this.cardColor,
    this.cursorColor,
    this.splashColor,
    this.mainTextColor,
    this.secondTextColor,
    this.thirdTextColor,
    this.fourthTextColor,
    this.fifthTextColor,
    this.sixthTextColor,
    this.darkLightColor,
    this.mainBackgroundColor,
    this.highlightColor,
    this.hoverColor,
    this.tabBarColor,
    this.navigationBarColor,
    this.forwardGroundColor,
    this.textSelectionColor,
    this.accentColor,
    this.miniPlayerColor,
    this.miniPlayerIconsColor,
  });

  Brightness? brightness;
  Color? backgroundColor = Colors.black;
  Color? scaffoldBackgroundColor;
  Color? bottomAppBarColor;
  Color? primaryColor;
  Color? cardColor;
  Color? cursorColor;
  Color? splashColor;
  Brightness? primaryColorBrightness;
  Color? accentColor;
  Color? mainTextColor;
  Color? secondTextColor;
  Color? thirdTextColor;
  Color? fourthTextColor;
  Color? fifthTextColor;
  Color? sixthTextColor;
  Color? darkLightColor;
  Color? mainBackgroundColor;
  Color? highlightColor;
  Color? hoverColor;
  Color? navigationBarColor;
  Color? tabBarColor;
  Color? forwardGroundColor;
  Color? textSelectionColor;
  Color? miniPlayerColor;
  Color? miniPlayerIconsColor;
}

class AppTheme {
  AppTheme(this.name, this.theme);

  String name;
  MyTheme theme;
}

ThemeData buildThemeData(AppTheme appTheme) {
  return ThemeData(
    platform: TargetPlatform.android,
    brightness: appTheme.theme.brightness,
    appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent),
    scaffoldBackgroundColor: appTheme.theme.scaffoldBackgroundColor,
    primaryColor: appTheme.theme.primaryColor,
    splashColor: appTheme.theme.splashColor,
    highlightColor: appTheme.theme.highlightColor,
    hoverColor: appTheme.theme.highlightColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(14),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    bottomAppBarTheme:
        BottomAppBarTheme(color: appTheme.theme.scaffoldBackgroundColor),
    colorScheme: ColorScheme.fromSeed(
      seedColor: HexColor('#FF7700'),
      brightness: appTheme.theme.brightness!,
      primary: HexColor('#FF7700'), //<-- SEE HERE
    )
        .copyWith(background: appTheme.theme.backgroundColor)
        .copyWith(secondary: appTheme.theme.accentColor),
  );
}

List<AppTheme> myThemes = [
  AppTheme(
    'Light',
    MyTheme(
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      bottomAppBarColor: Colors.transparent,
      accentColor: Colors.deepOrangeAccent,
      // Black
      cursorColor: HexColor('#FF7700'),
      // Orange
      textSelectionColor: HexColor('#060F17'),
      // Black
      mainBackgroundColor: HexColor('#FAFAFA'),
      // BackgroundGrey
      navigationBarColor: HexColor('#FFFFFF'),
      // White
      scaffoldBackgroundColor: HexColor('#FFFFFF'),
      // White
      primaryColor: HexColor('#FAFAFA'),
      // BackgroundGrey
      secondTextColor: HexColor('#060F17'),
      // Black
      thirdTextColor: HexColor('#747474'),
      // LightGrey
      fourthTextColor: HexColor('#2E2E2E'),
      // Darkgrey
      fifthTextColor: HexColor('#00347E'),
      // Blue
      sixthTextColor: HexColor('#00347E'),
      // Blue
      darkLightColor: HexColor('#F8BB80'),
      // LightOrange
      tabBarColor: HexColor('#FAFAFA'),
      // White
      forwardGroundColor: HexColor('#FFFFFF'),
      // White
      backgroundColor: HexColor('#000000'),
      // Black
      mainTextColor: HexColor('#FFFFFF'),
      miniPlayerColor: HexColor('#FFFFFF'),
      miniPlayerIconsColor: HexColor('#000000'),
    ),
  ), // White
  AppTheme(
    'Dark',
    MyTheme(
      brightness: Brightness.dark,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      bottomAppBarColor: Colors.transparent,
      accentColor: Colors.deepOrangeAccent,
      // White
      cursorColor: HexColor('#FF7700'),
      // Orange
      textSelectionColor: HexColor('#060F17'),
      // Black
      mainBackgroundColor: HexColor('#060F17'),
      // Black
      navigationBarColor: HexColor('#111111'),
      // LightBlack
      scaffoldBackgroundColor: HexColor('#000000'),
      // Black
      primaryColor: HexColor('#212121'),
      // BackgroundGrey
      secondTextColor: HexColor('#FFFFFF'),
      // White
      thirdTextColor: HexColor('#FAFAFA'),
      // BackgroundGrey
      fourthTextColor: HexColor('#FAFAFA'),
      // White
      fifthTextColor: HexColor('#FFFFFF'),
      // White
      sixthTextColor: HexColor('#00A5F7'),
      // Lightblue
      darkLightColor: HexColor('#060F17'),
      // Black
      tabBarColor: HexColor('#2E2E2E'),
      // Darkgrey
      forwardGroundColor: HexColor('#1E1E1E'),
      // Black
      backgroundColor: HexColor('#FFFFFF'),
      // White
      mainTextColor: HexColor('#FFFFFF'),
      // White
      miniPlayerColor: HexColor('#303030'),
      miniPlayerIconsColor: HexColor('#FFFFFF'),
    ),
  ),
];
