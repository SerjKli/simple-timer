import 'package:flutter/material.dart';
import 'package:simpletimer/utils/theme/color_schema.dart';
import 'package:simpletimer/utils/theme/ui_values.dart';
import 'package:simpletimer/widgets/app_gap.dart';

import 'app_icon.dart';

class AppBaseBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final List<Widget>? actions;

  const AppBaseBar({
    Key? key,
    required this.title,
    this.actions,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).extension<AppColorScheme>()!;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) AppIcon(icon: icon!),
          if (icon != null) const AppGap.vertical(),
          Text(
            title,
            style: TextStyle(color: colorScheme.brand),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0,
      flexibleSpace: Container(
        color: Colors.transparent,
      ),
      actions: actions,
      elevation: UiValues.elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
