import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/extensions/context.dart';

import 'app_bar.dart';
import 'app_icon.dart';

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
    this.isInSafeArea = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBaseBar(
        title: 'SimpleTimer',
        icon: titleIcon,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const AppIcon(icon: Icons.settings),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: context.colorScheme.bgGradient),
        child: isInSafeArea ? SafeArea(child: body) : body,
      ),
    );
  }
}
