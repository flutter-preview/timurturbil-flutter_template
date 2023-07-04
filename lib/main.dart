import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/constants.dart';
import 'package:flutter_template/utils/pref.dart';
import 'package:flutter_template/utils/providers/theme_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'utils/route_user.dart';
import 'utils/set_locale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer(
        builder:
            (BuildContext context, ThemeProvider themeProvider, Widget? child) {
          return MyApp(isDark: themeProvider.isDark);
        },
      )));
}

class MyApp extends StatefulWidget {
  final bool isDark;
  const MyApp({super.key, required this.isDark});

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
      supportedLocales: locales,
      locale: _locale,
      localizationsDelegates: localizationsDelegates,
      title: 'Flutter Demo',
      theme: widget.isDark ? ThemeData.dark() : ThemeData.light(),
      home: routing(),
    );
  }
}
