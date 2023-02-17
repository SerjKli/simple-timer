import 'package:flutter/material.dart';

import '../../utils/theme/ui_values.dart';

class AppDialog extends StatelessWidget {
  final Widget title;
  final Widget body;
  final List<Widget>? actions;

  const AppDialog({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
  }) : super(key: key);

  List<Widget> _buildActions() {
    if (actions == null) return [const SizedBox()];

    return actions!;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: UiValues.paddingEdgeLg,
      title: title,
      content: body,
      actions: _buildActions(),
      actionsOverflowDirection: VerticalDirection.up,
    );
  }
}
