import 'package:flutter/material.dart';
import 'package:flutter_template/languages/abstract_language.dart';
import 'package:flutter_template/utils/select_color.dart';
import 'package:provider/provider.dart';
import '../utils/providers/theme_provider.dart';
import '../utils/style/colors.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text(Languages.of(context).home_page),
            backgroundColor: selectColor(
                themeProvider.isDark, null, themeProvider.mainColor),
          ),
          drawer: const DrawerWidget(),
          body: Center(
            child: Text(Languages.of(context).welcome_flutter_template),
          ));
    });
  }
}
