import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization_delegate.dart';

const List<Locale> locales = [
  Locale('en', 'US'),
  Locale('tr', 'TR'),
];

const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  AppLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
