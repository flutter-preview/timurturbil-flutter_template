import 'package:flutter/material.dart';

Color? selectColor(bool isDark, Color? darkColor, Color? lightColor) =>
    isDark ? darkColor : lightColor;
