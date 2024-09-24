import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:challenge/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initHiveForFlutter();

  App.mainSharedPreferences = await SharedPreferences.getInstance();

  final themeIndex = App.mainSharedPreferences!.getInt('selectedThemeIndex');
  if (themeIndex == null) {
    await App.mainSharedPreferences!.setInt('selectedThemeIndex', 2);
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de'), Locale('tr')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: await builder(),
    ),
  );
}
