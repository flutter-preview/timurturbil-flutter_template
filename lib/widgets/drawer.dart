import 'package:flutter/material.dart';
import 'package:flutter_template/utils/style/colors.dart';
import 'package:provider/provider.dart';

import '../languages/abstract_language.dart';
import '../pages/language_selection_page.dart';
import '../utils/navigator.dart';
import '../utils/providers/theme_provider.dart';
import '../utils/select_color.dart';
import 'color_picker_dialog.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider themeProvider, child) {
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: selectColor(
                      themeProvider.isDark, null, themeProvider.mainColor),
                ),
                child: Text(
                  Languages.of(context).drawer_header,
                  style: TextStyle(
                    fontSize: 24,
                    color: selectColor(themeProvider.isDark, null, whiteColor),
                  ),
                ),
              ),
              ListTile(
                title: Text(Languages.of(context).change_language),
                onTap: () {
                  Nav.route(const LanguageSelectionPage());
                },
              ),
              ListTile(
                title: Text(Languages.of(context).change_theme),
                onTap: () {
                  // themeProvider.mainColor = Colors.red;
                  showColorPickerDialog(context, themeProvider);
                },
              ),
              ListTile(
                title: Text(themeProvider.isDark
                    ? Languages.of(context).dark_mode
                    : Languages.of(context).light_mode),
                onTap: () {
                  themeProvider.isDark = !themeProvider.isDark;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
