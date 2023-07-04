import 'package:flutter/material.dart';
import 'package:flutter_template/utils/select_color.dart';
import 'package:provider/provider.dart';

import '../languages/abstract_language.dart';
import '../utils/navigator.dart';
import '../utils/providers/theme_provider.dart';
import '../utils/set_locale.dart';
import 'home_page.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Languages.of(context).select_language),
            backgroundColor: selectColor(
                themeProvider.isDark, null, themeProvider.mainColor),
          ),
          body: ListView(
            children: [
              LanguageItem(
                flagAsset: 'assets/images/turkey_flag.png',
                countryName: Languages.of(context).turkish,
                onTap: () {
                  changeLanguage(context, "tr");
                  Nav.offAll(const HomePage());
                },
              ),
              LanguageItem(
                flagAsset: 'assets/images/england_flag.png',
                countryName: Languages.of(context).english,
                onTap: () {
                  changeLanguage(context, "en");
                  Nav.offAll(const HomePage());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String flagAsset;
  final String countryName;
  final VoidCallback onTap;

  const LanguageItem({
    super.key,
    required this.flagAsset,
    required this.countryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          children: [
            Image.asset(
              flagAsset,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 20.0),
            Text(
              countryName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
