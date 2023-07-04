import 'package:flutter/material.dart';
import 'package:flutter_template/languages/abstract_language.dart';
import 'package:flutter_template/utils/select_color.dart';
import 'package:flutter_template/utils/style/colors.dart';

import '../utils/providers/theme_provider.dart';

void showColorPickerDialog(BuildContext context, ThemeProvider themeProvider) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(Languages.of(context).selectAColor),
        content: Wrap(
          children: [
            _buildColorOption(Colors.blue, themeProvider),
            _buildColorOption(Colors.red, themeProvider),
            _buildColorOption(Colors.green, themeProvider),
            _buildColorOption(Colors.yellow, themeProvider),
            _buildColorOption(Colors.purple, themeProvider),
            _buildColorOption(Colors.orange, themeProvider),
            _buildColorOption(Colors.pink, themeProvider),
            _buildColorOption(Colors.teal, themeProvider),
            _buildColorOption(Colors.brown, themeProvider),
            _buildColorOption(Colors.grey, themeProvider),
            _buildColorOption(Colors.black, themeProvider),
            _buildColorOption(Colors.white, themeProvider),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(Languages.of(context).cancel,
                style: TextStyle(
                    color: selectColor(
                        themeProvider.isDark, whiteColor, blackColor))),
          ),
        ],
      );
    },
  );
}

Widget _buildColorOption(Color color, ThemeProvider themeProvider) {
  return GestureDetector(
    onTap: () {
      themeProvider.mainColor = color;
    },
    child: Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ),
  );
}
