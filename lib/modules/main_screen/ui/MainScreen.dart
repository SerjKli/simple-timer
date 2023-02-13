import 'package:flutter/material.dart';
import 'package:simpletimer/widgets/app_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScreen(
      screenTitle: "SimpleTimer",
      titleIcon: Icons.timer,
      body: Text('helloc'),
    );
  }
}
