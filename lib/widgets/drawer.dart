import 'package:flutter/material.dart';
import 'package:flutter_template/utils/set_locale.dart';

import '../utils/navigator.dart';

Drawer drawerMethod(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Change Language'),
          onTap: () {
            changeLanguage(context, "tr");
            Nav.pop();
          },
        ),
        ListTile(
          title: const Text('Change Theme'),
          onTap: () {
            changeLanguage(context, "en");
            Nav.pop();
          },
        ),
        ListTile(
          title: const Text('Change Dark/Light Mode'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
