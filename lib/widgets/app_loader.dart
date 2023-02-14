import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpletimer/widgets/app_gap.dart';
import 'package:simpletimer/widgets/app_icon.dart';

class AppLoader extends StatelessWidget {
  final String text;
  const AppLoader({Key? key, this.text = "loading..."}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppIcon(icon: FontAwesomeIcons.spinner),
        const AppGap.vertical(),
        Text(text),
      ],
    );
  }
}
