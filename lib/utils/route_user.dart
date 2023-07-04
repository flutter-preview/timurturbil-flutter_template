import 'package:flutter/material.dart';
import 'package:flutter_template/utils/pref.dart';

import '../pages/auth/login_page.dart';
import '../pages/home_page.dart';
import '../pages/onboarding_page.dart';

Widget routing() {
  var tokenData = Prefs.getString("access_token") ?? "";
  if (tokenData == "") {
    return const HomePage();
  } else {
    bool? isOpenedOnBoard = Prefs.getBool("isOpenedOnBoard");
    if (isOpenedOnBoard == null) {
      Prefs.setBool("isOpenedOnBoard", true);
      return const OnBoardingPage();
    } else {
      return const LoginPage();
    }
  }
}
