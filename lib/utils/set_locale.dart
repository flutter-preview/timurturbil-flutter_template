import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  String locale = Platform.localeName.split('_')[0];
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(prefSelectedLanguageCode) ?? locale;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  String locale = Platform.localeName.split('_')[0];
  return languageCode != null && languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : Locale(locale, '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var _locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, _locale);
}
