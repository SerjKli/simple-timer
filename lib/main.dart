import 'package:flutter/material.dart';
import 'package:simpletimer/modules/main_screen/ui/MainScreen.dart';
import 'package:simpletimer/utils/theme/ThemeService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeService(themeMode: ThemeData.light()).themeData;
    final darkTheme = ThemeService(themeMode: ThemeData.dark()).themeData;

    return MaterialApp(
      title: 'SimpleTimer',

      /// Hide debug banner
      debugShowCheckedModeBanner: false,

      /// Theme data
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,

      home: const MainScreen(),
    );
  }
}
