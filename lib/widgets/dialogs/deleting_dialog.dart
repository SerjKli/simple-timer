import 'package:flutter/material.dart';
import 'package:simpletimer/utils/enums/ColorTypes.dart';
import 'package:simpletimer/widgets/app_button.dart';

class DeletingDialog extends StatelessWidget {
  final Widget title;
  final Widget? body;

  const DeletingDialog({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: body,
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        AppButton.regular(
          title: "Delete",
          colorType: ColorTypes.error,
          onTap: () {
            Navigator.of(context).pop(true);
          },
        ),
        AppButton.regular(
          title: "Cancel",
          onTap: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
