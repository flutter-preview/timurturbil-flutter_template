// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get log_in;
  String get login;
  String get save;
  String get close;
  String get camera;
  String get no;
  String get yes;
  String get warning;
  String get logout;
  String get cant_be_empty;
  String get invalid_email;
  String get enter_your_email;
  String get email;
  String get enter_your_password;
  String get password;
  String get success;
  String get error;
  String get email_or_password_wrong;
  String get search;
  String get description;
  String get notes;
  String get saving_the_data_is_successful;
  String get privacy_policy_text;
  String get could_not_open_policy;
  String get list;
  String get no_image_selected;
  String get change_language;
  String get select_language;
  String get application_language;
  String get turkish;
  String get english;
  String get confirm;
  String get image;
  String get user_policy;
  String get date;
  String get please_fill_all_fields;
  String get name;
  String get lastname;
  String get address;
  String get cancel;
  String get phone;
  String get welcome_flutter_template;
}
