import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import 'app_bar.dart';

class AppScreen extends StatelessWidget {
  /// Screen's bar properties
  final String screenTitle;
  final IconData? titleIcon;
  final List<Widget>? actions;

  /// Screen's body properties
  final Widget body;
  final bool isInSafeArea;

  const AppScreen({
    Key? key,
    required this.screenTitle,
    required this.body,
    this.titleIcon,
    this.actions,
    this.isInSafeArea = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: context.colorScheme.bgGradient),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBaseBar(
          title: screenTitle,
          icon: titleIcon,
          actions: actions,
        ),
        body: isInSafeArea ? SafeArea(child: body) : body,
      ),
    );
  }
}
