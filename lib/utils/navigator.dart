import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav {
  static route(Widget screen) {
    Get.to(() => screen);
  }

  static pop() {
    Get.back();
  }

  static offAll(Widget screen) {
    Get.offAll(screen);
  }
}
