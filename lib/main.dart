import 'package:currency_converter/utils/theme.dart';
import 'package:currency_converter/views/screens/history_page.dart';
import 'package:currency_converter/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/history_page", page: () => const HistoryPage()),
      ],
    ),
  );
}
