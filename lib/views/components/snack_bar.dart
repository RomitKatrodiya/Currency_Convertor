import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBar({required title, required subTitle, required icon}) {
  Get.snackbar(
    title,
    subTitle,
    icon: Icon(icon, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 1),
    barBlur: 0,
    margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
    colorText: Colors.white,
    backgroundColor: Colors.red,
    animationDuration: const Duration(seconds: 1),
  );
}
