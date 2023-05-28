import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/pages/auth/login_page.dart';
import 'package:flutter_template/pages/home_page.dart';
import 'package:flutter_template/pages/onboarding_page.dart';
import 'package:flutter_template/utils/pref.dart';
import 'package:flutter_template/utils/providers/example_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'languages/abstract_language.dart';
import 'languages/en_language.dart';
import 'languages/tr_language.dart';
import 'utils/set_locale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ExampleProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('nl', 'NL'),
        Locale('tr', 'TR'),
      ],
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Navigator(),
    );
  }
}

class Navigator extends StatefulWidget {
  const Navigator({super.key});
  @override
  State<Navigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  @override
  Widget build(BuildContext context) {
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
}

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'tr'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'tr':
        return LanguageTr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
