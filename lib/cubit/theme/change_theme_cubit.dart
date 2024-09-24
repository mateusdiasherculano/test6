import 'package:bloc/bloc.dart';
import 'package:challenge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit({required this.mainSharedPreferences})
      : super(
          mainSharedPreferences!.getInt('selectedThemeIndex') == 2
              ? ThemeAutoState()
              : mainSharedPreferences.getInt('selectedThemeIndex') == 0
                  ? ThemeLightState()
                  : ThemeDarkState(),
        );
  final SharedPreferences? mainSharedPreferences;

  AppTheme getAppTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (mainSharedPreferences!.getInt('selectedThemeIndex') == 2) {
      if (brightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return myThemes[0];
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return myThemes[1];
      }
    }
    return myThemes[mainSharedPreferences!.getInt('selectedThemeIndex')!];
  }

  int getTheme() {
    return mainSharedPreferences!.getInt('selectedThemeIndex')!;
  }

  void setThemeMode(int mode) {
    switch (mode) {
      case 0:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        emit(ThemeLightState());
      case 1:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        emit(ThemeDarkState());
      case 2:
        emit(ThemeAutoState());
    }
    mainSharedPreferences!.setInt('selectedThemeIndex', mode);
  }
}
